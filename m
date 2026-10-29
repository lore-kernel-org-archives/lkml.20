Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793315896;
	b=hFI/pr0d4dyGJVUrIp82P+ZOwobEV+Q9agLoM8I3I7j/zW2TXKNPutGUN1dBCxfeE43U
	 3RJJPkp/KUa78+jDMO6s+fVdhalV7hw5qF4oHbsFJ6gWQ6pCTvDaRWqajQOouR9YpbrPE
	 QV1ooDxPhEeHpcVZHYlt4lnL7KQ6IjTTiQyKkvXWgBt7ukTePLReMNpzI2pP9m38Ghwqf
	 q4OEgJMVYlfieRMqcR2J4ePHuo8Hek6+FHAlotoyf6PykX3cA4Bml+rQlGCx8njAd0F8t
	 6Odgx3Vd3fx3YB9Jxbsx+v9ZaQWKL+mO4O7V4f8dx2bXPJo8hQeA/nxXe3mGtwUzmMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793315896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=lM+aGMHQoGHm+tWBHiCUU2JkCdwvd5cdpFbqD9BSPP4=;
	b=QU87+HdQ2B9otLRCzmtiY+yOLHfmy+9BcKATkvixlTZhE2JwEeWGHNL5QxudXdorqIkz
	 oFdFy6w3kh9ILVkOKI0+wbBw1r/u4b1SYI7BrwC/Agk96UYuH8N+HH0X9y6U/fgaTXbRk
	 AShpatlbgO5kzZjZ3TrlQAZWz45ZZd2MUYO3Rc5yJhDCymLorsPahAGkec3zeaFAsPTYG
	 ypyE1XMnWjtwjOul0Svtrz8sao9MBb0rBcMLWfIDcVYmVAyRZBGmWEFnMG96NKm0rv8qx
	 IrGaUKhbLTCQowO2G8OQsw+bRAgbIVnzaO77BajUzuGmHppWz69Uqi7OJJ2ymoFKitg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zsMpCzh6;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBC1606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EBC1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zsMpCzh6
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-99071945aa7so66393241.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793315894; x=1793920694; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lM+aGMHQoGHm+tWBHiCUU2JkCdwvd5cdpFbqD9BSPP4=;
        b=zsMpCzh62pJ8Qbji29nhDyEkEY1fOuZsobLLBw/2xJxlzB89AlkdbhfnytcFhhCBV5
         9JhHi0eeXsZzlknjBuuFAP9e6MYmyYxL0maPn9WrnQc/pu4meVqfB4O+yjKkHZQgN8A5
         Lp/wXFsC9DxW+CgpiGhJOvWLcKHvMN8koX9aKl88KgfkMkoMmOkBVxvXfrmCJTSxxf83
         NysJscKl6MTOyeZUBdreIxwO4irVEI/hjSkeoIDi+CO8yvytYow8HQk5jpG8T63GaSCT
         1p84tqPaSUXwmHOHrIjTrsGr4JummFT8s2PB459byNxe0Q5dneUBKa39ufjQWPNeRK0R
         VwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793315894; x=1793920694;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lM+aGMHQoGHm+tWBHiCUU2JkCdwvd5cdpFbqD9BSPP4=;
        b=lUbAuPhfEyYmXCruJTZCBYYzCXlebxzYRewSuNhdJ2hrmsNI2pCaWqUZHwmKXN+CBa
         zOrvHu18VGFH6th59R13bbCJrcQPiJbDiWcyLGewYQBG3ELZQJqgEy15+X+wrT9xQAhE
         Sn2oH2bZWWY0jAsPhRMMxnLqyfUj8uWV/je54EjMhn7g0wFJp5EEFQ1wzZ2Dt2U9lmJl
         DrtKUKI1BPLzifJ3u+Lg8GXfYDrgdMX0c4/zDAX54t9i8CxZcfi51s8joDACBnRvLD6r
         E5RpBQyW3216izwLANWrbwaKYl92DndGB+moWaJyt9HjiM6HB7ol6S4H4Vo8Fe6I27PI
         nRXg==
X-Forwarded-Encrypted: i=1; AKwUvBwbU7Vps+vGx0o2sMwsamdZRsLEJSV+Cs7K19wJoPPKCoZScSfDhC5RoQ25p8GSQsZoKQvE4+C+eLz+4LY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/EIB83OFZ1VYPxS5j4Tq4lvdPGESrvl3KduQlU97j8Ra42YPz
	2VcOo/B2X/6pimu1RmkW3MwZFCkA8neUn3l4qPqwb/97UD6LpvNN78xz
X-Gm-Gg: AYBFou2nEF28EQzXIWFVMBZpINa1FprJD0R+/w9nIAHSrzyhRehn+fHHx92UUtcm5Cl
	dbdTxrYhd2aUIK6iQQLSuhdVk/kxjzqD2zRGJEXC7jMHgTi+iawukvPtuBQmd7KvvpZEnVEYOTh
	MyAixV6UVFjH9y2T+FwuFCw3/Vl2JGqZZp9k9i80quuYpoR+fTkxhgmkR5Rm6WK925J+PPqOs4u
	Sem2FSxo6z7iYNaJsldcfBHN7k/jLYR/bKSJoi6PfnOq3xzCsKNVo5pZUWgo5pixAB/Kp8a3fZY
	Pyvbn7OCe3EuDcdRUC0+zdnKHEG3pUzgbhAwZ9AVBrT5meYX4erIOPKot97Bcrqqmake9MmElUc
	qaLWdkFM0yKkhHLhkL/SHAHfZvlhgo5i/ISOJ11Tm9njcWqdM6CF3eHYF4FB1zQOf02zkUb+kiY
	r4zoAWKM/OVD29a23z2CiYikeK6pMkm4gSt3VGHeraOfr9cofRVCOsTJJzunf3jAP4gN8PBrQEb
	mHQYbQc40J78fgjtHWr304Zzk4G4RtC5sf/x00/ADF63Em0lJP9IJoQ9hjsjO3ihKQ+/h+0rczZ
	RV3IhkE4SGQ3c5G8BZxbES3LJ2/b7I57QUYMhlBNROuc0j6nNG63A+aTJIPUAG0xmyOi2jciAed
	hs7/yjsnJ45W5
X-Received: by 2002:a05:6102:3e85:b0:7c7:f976:ea9c with SMTP id ada2fe7eead31-7d072bc74fcmr439527137.13.1793315894465;
        Thu, 29 Oct 2026 16:18:14 -0700 (PDT)
Received: from [192.168.15.16] ([2804:1b3:a2c1:77a1:5cd:8fee:f3c:4da7])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee4e7453sm319509241.11.2026.10.29.16.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:18:13 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Zhenghang Xiao <kipreyyy@gmail.com>,
 Sanghyun Park <sanghyun.park.cnu@gmail.com>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 4/5] nfc: st21nfca: validate pipe ids in
 st21nfca_hci_load_session()
Date: Thu, 29 Oct 2026 20:17:35 -0300
Message-ID: <179331585573.30322.2945646231359516234@gmail.com>
In-Reply-To: <179331585573.30322.4049957541187612575@gmail.com>
References: <179331585573.30322.4049957541187612575@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

st21nfca_hci_load_session() gets the list of open pipes from the
controller and, for each pipe id in it, asks for the pipe information
and records it in hdev->pipes[].  The pipe id is a byte from the
controller and is used as an index into hdev->pipes[], which has
NFC_HCI_MAX_PIPES (128) entries, without any check.  For a pipe id of
128 or more that the controller reports as open on one of the known
gates, the gate id and the controller supplied host id are written past
the end of the array, over the rest of struct nfc_hci_dev (including
the async_cb function pointer) and, for larger ids, past the end of the
object.

The pipe information response is not length checked either, so a
short response is read past its end.

Skip pipe ids that do not fit in hdev->pipes[] and responses that are
shorter than struct st21nfca_pipe_info.

This was pointed out as a pre-existing issue by the sashiko review of an
nfc_hci_create_pipe() fix.

Link: https://lore.kernel.org/all/178952042575.22033.9676833200303972344@kernel.org/
Fixes: 2130fb97fecf ("NFC: st21nfca: Adding support for secure element")
Cc: stable@vger.kernel.org
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
 drivers/nfc/st21nfca/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/nfc/st21nfca/core.c b/drivers/nfc/st21nfca/core.c
index b5c1ca3ac..88856c26c 100644
--- a/drivers/nfc/st21nfca/core.c
+++ b/drivers/nfc/st21nfca/core.c
@@ -147,12 +147,20 @@ static int st21nfca_hci_load_session(struct nfc_hci_dev *hdev)
 	/* Complete the existing gate_pipe table */
 	for (i = 0; i < skb_pipe_list->len; i++) {
 		pipe_info[2] = skb_pipe_list->data[i];
+		if (pipe_info[2] >= NFC_HCI_MAX_PIPES)
+			continue;
+
 		r = nfc_hci_send_cmd(hdev, ST21NFCA_DEVICE_MGNT_GATE,
 					ST21NFCA_DM_GETINFO, pipe_info,
 					sizeof(pipe_info), &skb_pipe_info);
 		if (r)
 			continue;
 
+		if (skb_pipe_info->len < sizeof(*info)) {
+			kfree_skb(skb_pipe_info);
+			continue;
+		}
+
 		/*
 		 * Match pipe ID and gate ID
 		 * Output format from ST21NFC_DM_GETINFO is:
-- 
2.43.0

