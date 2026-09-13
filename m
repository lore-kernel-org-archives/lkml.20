Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD5C388E7A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789334090; cv=none; b=u28PV4nwb/YIoOZTLgwTkZm7i4Pktv+qsYFvWTjswpXpncblU7ylTx4RBkrImnFn9uszC5cBiIWW/A7nInNDeCU93KkN7MvYaiHopBfx1+yi5HHm53mfYcISqrqvprSKSkfCh+sE8lhHBWXDBjYn2H5lGqgMIOTYr5PFxirZCmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789334090; c=relaxed/simple;
	bh=pPoaZ6WN/4rsL54zfkdxxVZNYOjgO9uDq+DyE0P6oAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IkLtlXID9+Myp8dtOaIqkYb4Hp33gdBpOCsnagSMA4UtkvOYH4jNvDI+uVDpii0+mi7l/dWbcZNYrPctfguRRzpmZ+D55JHp0J5JRLL/Eb1vZwlFYYtr15Tr7q7DzYkf2EqT4smlfnZbozfLQqYxUtr3ovmPhHY0jrxm4sHneTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GK6yGtT8; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GK6yGtT8"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd4be7a5e3so1754365ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789334088; x=1789938888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZpCRHMmToydeaRFWtETHuU4TdBo7QJCJ2jk+hcXVaYc=;
        b=GK6yGtT8sT4fQuA6JTb+gE6Xl172A4Diy+aaJ9NhF+95yuSg+7mGWJ8S9luluzzO7a
         0FPRhEFaF8hT1dbNrOUA1S0WULjtkhjojPLgBKE9a9UmdIyka9p1HOsU1KS2jcgxm0Ga
         ruj1PnESJFaQwzeSTTLeraH7tSo5b5HbhQwkEu1jyksOSul6cPmhq/MMTWW17UvCh8Va
         Ioa8pXcibG2UnlY0lxvVOd2BISrvGdlxZp5MGkk5ELLTZTMjYNaVsL2FzSFBVDpJylmr
         GA6xNfGhOIWEm0PS+a9V0gPLGud+u1DmQTiiNr9dFRR/YG9AQ2O5f85SXdM/kt1G38ao
         tDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789334088; x=1789938888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZpCRHMmToydeaRFWtETHuU4TdBo7QJCJ2jk+hcXVaYc=;
        b=qfDA95gox7DdbOG/+9jkguJzOVeWixHwegUHXCNIhld/wXFeKmpXo5DACbwIrf/M+L
         R+JDdC/ijmVuYRB/ypI3hzkAO5SgcwbNpLGY1uDQs51wjQ6nZT1prqxzK1YKBse8qJtw
         MBcI1dYxH/JQ1uV8FGMoD2AV2Al9FyqiHsqdcIKXTjWUckwtZwgrgLRMroVUAB0djCDX
         2uWSqA0c47Il+HIx60NuLJhUxOqQpXXtW/t4TNr3yV4yZv15FsukvxZtWQIEx1zHy/vM
         n0cE+gwLphFjniv+9fgmKifuT9E5fjEy5mBjjvtjFtTDlf5ovJqBOwkNx8EijXJX9meu
         ZHyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvfze2giqBFxB+HFKBcLY4izkyTIWbHTqVYua9pSR/wnvMOwYmK5+9n3n+v/K7uLVykRCnDYexPK6drMk=@vger.kernel.org
X-Gm-Message-State: AFuF++m7oggDrs0+uO8ygvKuUfLR//m34/gZhwUT7xu88Wcjz/Kyt3Te
	wvDCknh1J3PA5g7wMmSPVUKSU2u+kkp48s0+Nr82MQswgflYXr7X2n6U
X-Gm-Gg: AYBFou1pLrzYp3f0PQ7EB4CPQ4x3gtgQmq73Tc/Fgwcd8N34kQ6vPSqZhQquzLSi18W
	nEmMk7MtNJPblYF7/Hg10Ab1NfEuU7Gu6XLDG7ZUmF128BHaEySjut0kEssJTT2iHZjn9kNU2iV
	1F6KXtnQKlx7vcK5GIMYsupxG6Dw4xmsvnsLZQM0jiQoEVrkMAdEwhDXoA97zEcdbWzz1U1py2z
	EZ/NKFOtzWPdmyz1/8Q5Q+iqOKYILSeojI5ilUurbLYjmLxCbI1IuK0RB20nXFDZAiKhP+ZeRMj
	kL31ExoXD1qqolLRh/K+l/9T+tB+FPHF8dh/Dqh/gofQhlW9DxoYPOtlQi6avBAaNemPabLL4Bc
	hYUsNFmS07E67hvZAHoy42WIskqd7WqRZP7TT0GDbn1QD/VWxEL6XPmYdH7iF+6rm3a0wRAvrlI
	5Nfcx0XRf5iEQDh82bDKQbMJGkSVfusoLZ+dsV73ewoyjoSmutSlKcDLKAk99malkxm63o2k6U1
	jhgkPW6X1GKvEC1OKA1VeXjm8XSj113SGnvkdY5LKDerXzbkpSqLxMYaeYoUmGrurKoHiNkQBQu
	GJj0m3g+MXpF5wIigud7tQ9l6wlEdnA=
X-Received: by 2002:a17:90b:5147:b0:398:a2e4:c784 with SMTP id 98e67ed59e1d1-39d9bbc25d1mr15745452a91.1.1789334087817;
        Sun, 13 Sep 2026 14:14:47 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.109])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm21382925c88.3.2026.09.13.14.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:14:47 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: miriam.rachel.korenblit@intel.com,
	linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	helgaas@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	emmanuel.grumbach@intel.com,
	nika@nikableh.moe,
	mpearson-lenovo@squebb.ca,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Navon John Lukose <navonjohnlukose@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH wireless v3 2/4] wifi: iwlwifi: pcie: don't infer CSME presence from a failed read
Date: Mon, 14 Sep 2026 02:44:26 +0530
Message-ID: <dba458f8bff1159de447653b03a9f39fb60e9549.1789333511.git.navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1789333511.git.navonjohnlukose@gmail.com>
References: <cover.1789333511.git.navonjohnlukose@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iwl_read_prph() returns 0x5a5a5a5a when it cannot grab NIC access, which
reads as "no CSME"; an all-ones CSR_HW_IF_CONFIG_REG reads as "CSME
present". me_present is never recomputed and gates the reset ladder, so one
bad read skews it for good. Reject both values. This does
downgrade a product reset that a poisoned read used to permit.

Cc: stable@vger.kernel.org
Fixes: 41fff83fe6cd ("wifi: iwlwifi: pcie: check for WiAMT/CSME presence")
Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
---
Applies as-is to 6.18.y and 7.2.y.

 .../net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c  | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c b/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
index a30854d..e5edcc2 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
@@ -4194,7 +4194,8 @@ static void iwl_pcie_recheck_me_status(struct work_struct *wk)
 	u32 val;
 
 	val = iwl_read32(trans_pcie->trans, CSR_HW_IF_CONFIG_REG);
-	trans_pcie->me_present = !!(val & CSR_HW_IF_CONFIG_REG_IAMT_UP);
+	if (!PCI_POSSIBLE_ERROR(val))
+		trans_pcie->me_present = !!(val & CSR_HW_IF_CONFIG_REG_IAMT_UP);
 }
 
 static void iwl_pcie_check_me_status(struct iwl_trans *trans)
@@ -4212,15 +4213,19 @@ static void iwl_pcie_check_me_status(struct iwl_trans *trans)
 		return;
 
 	val = iwl_read_prph(trans, CNVI_SCU_REG_FOR_ECO_1);
-	if (val & CNVI_SCU_REG_FOR_ECO_1_WIAMT_KNOWN) {
+	/* iwl_read_prph() returns 0x5a5a5a5a if it never reached the NIC, and
+	 * that value has WIAMT_KNOWN set and WIAMT_PRESENT clear
+	 */
+	if (!PCI_POSSIBLE_ERROR(val) && !iwl_trans_is_hw_error_value(val) &&
+	    (val & CNVI_SCU_REG_FOR_ECO_1_WIAMT_KNOWN)) {
 		trans_pcie->me_present =
 			!!(val & CNVI_SCU_REG_FOR_ECO_1_WIAMT_PRESENT);
 		return;
 	}
 
 	val = iwl_read32(trans, CSR_HW_IF_CONFIG_REG);
-	if (val & (CSR_HW_IF_CONFIG_REG_ME_OWN |
-		   CSR_HW_IF_CONFIG_REG_IAMT_UP)) {
+	if (!PCI_POSSIBLE_ERROR(val) && (val & (CSR_HW_IF_CONFIG_REG_ME_OWN |
+					       CSR_HW_IF_CONFIG_REG_IAMT_UP))) {
 		trans_pcie->me_present = 1;
 		return;
 	}
