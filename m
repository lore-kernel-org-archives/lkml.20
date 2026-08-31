Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF884A1E0B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183710; cv=none; b=s+/wTEFx+BwyEUgPbZNU/x7Nsl6tU1cFwl3vc7hF+fevzMJCg5RPnZ7R3QeWcoG806EtTBGW1NwW3ytafZ6JnDrgaSN1RJPb26Xqkz7mpx1jz5kj3pn/NBgBBf8yUligvV4LnKvj7eLhkn4/MtJTZYu14K7venrmRuS5GF4ETt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183710; c=relaxed/simple;
	bh=IMH5XC1IQty2kDprL4vVOLUz5Rdo2SwjUCPUHF5zKr0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gWXRfUoIB+NMQNMrbrCnUpIgUoIu/DXV04ohJP0sQvZuhE4h26WGROYW3Wa24jm8LfBnOEOMdNR3GYKXfS+SOY/aKUKwwqlbPMqdmbo4lPYDLuvmOo4fcFAmuQ+6OunCRcMMsYv0TaXICCLrvkv0zR9LB4f/15Uv6BC3dBg7e2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+7dIIom; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+7dIIom"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca5b707b78aso571908a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788183707; x=1788788507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KrvWK7y12wmzNf9yKs8qJQvTPbcMwwSOqP849lffmgI=;
        b=f+7dIIomVJa6uRIKV5UlrAw23v8IxJO0is8Mwl3aHFseDGbGnDZ3GbUyCY7JzADIyu
         KlqKspw7kPOpEdZ/mrVqsyUaNp0/ePM3CFNe4mWoj1qtgW6i2eG0O0yv/0Cd42hrN41T
         chKc/ZvyV0OhqcvvCj1NsqvClxRAYH1Y94cjpaNywRHVn1vEl2iXxlQSU9JpEzFwqMe7
         x8urBPi2JVu2haxMMnQEV6a5fO7Fr0uaqgCNuSaHf6ef0tm5jnnQkqwiFBSqoIpiroHl
         tAcGtgV/CZgx+6fgUBzlmYKnluEIK8oRUb0csW5PbfZqXLOLnL/lqzQAMzR8xK0IFxVa
         3VOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788183707; x=1788788507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KrvWK7y12wmzNf9yKs8qJQvTPbcMwwSOqP849lffmgI=;
        b=jUMN14GnGotegN4vyDt+KQc4rIU9rpZ41HJ9X4n+AB9PFsKwLH2MQ3DDXGkDAoqdUy
         OXDR0SB1wSTFymMvYdOza0cAAnToB8En231MKm2ZiVjPbWHotpjUaU7FIxaIuLim+rQi
         l66XOC+CEvTiC67TLfmFtLA3m8wV3Yc9i3hzCIKycJuZqB2oHa0jnWvJgKTd8eSkElMT
         Opd1T8v6BVOih1+BLSqmibfKh/g/uW0Q7k/+Xd5DHK3ViyhqX9nfeo3EHO2ZP+YDIwXb
         IelwSxE5fnjK/oipQTx072FfJMgLXvFuqVBPMzjZpt7aH5b0hZbV1kj8kEyRMVdwlBKR
         85Fg==
X-Forwarded-Encrypted: i=1; AKwUvBxDEVU94I8p3N5LUNQw4/60JqJulbw955hD11t81IUWCh28O6mDAfEpFYNZh8zERSZGt+jRGrk3NQ9Dgtk=@vger.kernel.org
X-Gm-Message-State: AFuF++nhjAan4YHZ3/gFhAIc2mKrkr437GCpt6iDyWqhaHkoPJgjuBAs
	Ba8rsVE7E4enb4TaGTTQaCp4T/Pbo+tu1EFTvk4HhS64Cqat+lEow0ETt5f4dg7v
X-Gm-Gg: AYBFou0w2DJBcL7AukVL87l8u9bR/uKXzgM/TbQJ3Xq2U+35Uf4pHPwBOYxaqlich85
	7+CC9PSLOnS3/4YUNyjaMYdLLbyYsskPzfKztmUsgV767xFwswHu7qCF+bQcRdTrfF86i+HC5XB
	M/SWWoMIEC93LH+7GPSHf2w7KUmcL0GNyvCDS1mhgVIP/lE0w/2s89ta0X5bE3nRQZLQD0jTeST
	x63sa52S68gsNsCdmHF86B7npWMgn6mRB9NC0Kb47aEkQtC2Nkv41HNQINgbx+4JElvnk/HH6Kk
	pzvlgkaHZa40+v7yN/2nSTT/2t48R6fqRn4DT+X1f7f4smE70WyolpxNPHEl7wzantqNf19m+HO
	OT+mX5AoT577t4rSC3pBlsiRhtwcuSfLYXvGMwFRJnCKEn1qb8gdH0vSbgLYPu9t5ySfxFbWPfg
	nOqTJe2p7ZWVf+8y5Ch1BOgiVTljN9rCatfUCRIXq/ODnIX8aRKfCLIUzsxiKjwFebK8Sz49fQ5
	83A+FDr5NMRj27rn5FXjo7amfis
X-Received: by 2002:a17:90b:4ad1:b0:38e:76f8:fcbb with SMTP id 98e67ed59e1d1-398bac28133mr12752617a91.4.1788183707208;
        Mon, 31 Aug 2026 06:41:47 -0700 (PDT)
Received: from cachyos-aura ([45.112.149.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7be440sm34752102eec.7.2026.08.31.06.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:41:46 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH wireless] wifi: iwlwifi: pcie: cancel the ME recheck work on probe failure
Date: Mon, 31 Aug 2026 19:11:40 +0530
Message-ID: <20260831134140.480276-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iwl_pcie_check_me_status() schedules me_recheck_wk a second out when it
cannot decide whether CSME is present yet. iwl_pci_gen1_2_probe() calls it
before iwl_drv_start(), and if that fails the error path goes straight to
iwl_trans_pcie_free() without cancelling the work. The trans, and with it
the delayed_work and the trans_pcie the callback dereferences, is freed
while the timer is still armed.

iwl_pcie_gen1_2_remove() does cancel it, so only the probe error path is
affected. Cancel it there too.

The window is narrow: reaching the schedule needs both reads in
iwl_pcie_check_me_status() to fail, and iwl_pci_probe() already bails with
-EIO on an all-ones CSR_HW_REV before iwl_pci_gen1_2_probe() runs, so it
takes a device that answers config space and CSR_HW_REV but then fails
iwl_trans_grab_nic_access(). I found this by inspection rather than by
tripping over it, and I have no way to force that state on the hardware I
have.

Cc: stable@vger.kernel.org
Fixes: 41fff83fe6cd ("wifi: iwlwifi: pcie: check for WiAMT/CSME presence")
Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
---
 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c b/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
index 28b276c..a30854d 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
@@ -4369,6 +4369,8 @@ int iwl_pci_gen1_2_probe(struct pci_dev *pdev,
 
 	if (IS_ERR(iwl_trans->drv)) {
 		ret = PTR_ERR(iwl_trans->drv);
+		/* iwl_pcie_check_me_status() may have armed this */
+		cancel_delayed_work_sync(&trans_pcie->me_recheck_wk);
 		goto out_free_trans;
 	}
 
-- 
2.55.0

