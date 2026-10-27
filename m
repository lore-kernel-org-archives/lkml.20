Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112061;
	b=P/N+mrPmq3ZcfO2W+pxe/J/HXUzVIsVT9MKXgkP/y/dOjjEUvZEpIfnSaEVI+hlYeZ9z
	 PliQTzRRpCam4wTmQE0ubskXYdJ8oGS95pTKNXUsFtlnmOJ3CO0wWSOOVQ14yoAAz5YC8
	 wvbNvwnNQAxpMX+9Myz61ymWe5y0S6w2OKqCorLsfUPFPvPwy3YOjUzkC36k/zAWqosNG
	 VwXJM5Q/tKqkvXZIZ5NI4C6RQtZYyGhFEdabeI1JPS1AfqQKLx2i3k9vagnb69UbM+s43
	 LRZyAEgrU13cBxe3DMEpYt+2Ym9N2T98abyGrRnhD/L14Ibp/1s7fA9AvwLbIB8teLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112061;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=MYg8DMW212t7KHN89JFfFbMgWrjWDg5NKX324IoPTAA=;
	b=ZDZPnWMoCKnNmap428dJZ8BPoeIoPweMjosqFeHZnA3gB7ezDhBXNyOopnrtzU/7+HZl
	 t5ZpZhuzLLgmXkmy8EF6is1oV040tOl0bVGSpnbKJX+i/tbSwHx7gHCc6bM7iXAIGvryZ
	 9mZOfe4xOqFRRinqxkC8nbUNWFWuamqaafW1u4pwqi/+/sdvsCufh/vjuYCsv2jIxvkRm
	 2ohz035YtDPv4N5KRLJvdH4Isc4k6Upk6UaPKQzR4NfWYqw5oFRZyLOO1NkRpe4SsJ/Aa
	 JniQnTZPfTPoTkMa/iuXimzmzzwoFUtx7f+cvDWJiG27Ehu2PW4L4wWjQU75p352xsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=sLxd+3Of;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504B4606A31E;
	Tue, 27 Oct 2026 14:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=sLxd+3Of
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C181F031E0;
	Tue, 27 Oct 2026 14:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793112060;
	bh=MYg8DMW212t7KHN89JFfFbMgWrjWDg5NKX324IoPTAA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=sLxd+3OfCr24LNH5kT6VR45O8Ulo2Xp+vWlebg2nwqmGnCnj1IjGCAeOI4X5qjPzH
	 hFcEZ6J9fZY5XzHMFSNmpj1dMa8pYN0lOGOZ7dn8o2eZNE+J9Kwkw/t8xqvMUSHlM1
	 j4dPxzOHkKy7y7j7lFk8Gb4WUhUyqCzbHf55piYE=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:40:46 +0100
Subject: [PATCH 3/7] usb: storage: ene_ub6250: fix write to unmapped MS
 block
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-llm-usb-storage-v1-3-d1655e94ed10@linuxfoundation.org>
References: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>, 
 "Cho, Yu-Chen" <acho@novell.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Greg Kroah-Hartman <gregkh@suse.de>, 
 linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net, 
 linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=2042;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=1uaqey8EFgWrOIzPx4SIIQXgTx3i2neNWdB5NgkCJDo=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPtn+adeab39/WvsTnT48VP3275uwyO9Zbl5ZPUch+7
 cjCpNbH0hHLwiDIxCArpsjyZRvP0f0VhxS9DG1Pw8xhZQIZwsDFKQATOVjNME8xw+CvjsGXe//Y
 E/c959Z3Tpv5K4FhwfVLn2v3P2p6LfA88nMhT4P0wo5NHAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

Writing to a logical block of a Memory Stick that has no physical block
assigned yet makes the ENE UB6250 driver write two bytes far past the
end of its Phy2LogMap allocation.

ms_scsi_write() looks up the current physical block of each logical
block with ms_libconv_to_physical().  For a logical block that no
physical block claimed during the scan, Log2PhyMap holds MS_LB_NOT_USED
(0xffff), and for a logical block beyond NumberOfLogBlock the macro
returns MS_STATUS_ERROR (0xfffe).  After copying the data to the new
block, the old one is marked as erased without any check:

    info->MS_Lib.Phy2LogMap[oldphy] = MS_LB_NOT_USED_ERASED;

which, for those values, stores 0xfff5 about 128KiB past the start of
an array that holds only NumberOfPhyBlock entries.  Unassigned logical
blocks are normal on a card that has not been completely written, and
the card contents are under the control of whoever supplies the card
or the reader.

The bug was found by code inspection and has not been reproduced.

Fix by only marking the old physical block as erased when it is a valid
physical block number.

Fixes: 33842cedfc33 ("Staging: Merge ENE UB6250 MS card codes from keucr to drivers/usb/storage/ene_ub6250.c")
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/storage/ene_ub6250.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
index a5ef1dcf0bc7..bce593730187 100644
--- a/drivers/usb/storage/ene_ub6250.c
+++ b/drivers/usb/storage/ene_ub6250.c
@@ -1805,7 +1805,8 @@ static int ms_scsi_write(struct us_data *us, struct scsi_cmnd *srb)
 				goto exit;
 			}
 
-			info->MS_Lib.Phy2LogMap[oldphy] = MS_LB_NOT_USED_ERASED;
+			if (oldphy < info->MS_Lib.NumberOfPhyBlock)
+				info->MS_Lib.Phy2LogMap[oldphy] = MS_LB_NOT_USED_ERASED;
 			ms_lib_force_setlogical_pair(us, PhyBlockAddr, newphy);
 
 			blen -= len;

-- 
2.56.0

