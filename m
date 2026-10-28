Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793225422;
	b=HW8p3vAKUkypbsPvS+0vdtj2pZ6MNiDC+Mc8oXZOJf8yN/SMNV85MWDyEKDfH3SAUGfp
	 JJWFBgWLwU8fOLTyxWY9FVYXzzFmjZ/eF48Gu/k7Q8E73PM2OAF6MN5zJvLToYdne8Fn5
	 J+3v+K7iWbky9YunHtgklZWL87eF0xZbR7buu830kIFATwMOxR2YDMQN5UZRHWcT9B5sZ
	 eAaK0iAgDfJZeTW8VslqnuOz8LsIe33MDCt9PSy6o2S1wOZtL1Rcu53+r5ngYGHwALFcQ
	 HTL25bHX1GH7Zsz7CI88vv3sXEPYgiur7+4ClGxwiWZ8X6Hw1Ss2e6iM55omPNXBvyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793225422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=HdW1B+PwB8W7tgHfDp5ShqzV+29fBGj0gnB17D0W0ok=;
	b=l3f9JnRp21HJj2BgRLPIHakJJgwU0h4P76zQBzD/50mCwIe9hr6NG0PJ47qnmzMtGxmX
	 f+tOziMmFItxvCvZzjLurPhybKecdLh3Ma3J187ovWbb6SXOwxFpQbu6pt3foSuY/J6cM
	 KlhIh3Zj/2OoH8Kjs6Ukl0Qgj80Yy0ZS0C6TLrG3DY3GSUfY5rAvJN3gEu7CtCsFP7n9O
	 sy7+Z/hjBzVuS6KlxWB+/DlyDWCJ1j/t9CaKKH0KWVERfjWqR0YkOp5HZafMmFQmK8j4p
	 rSiobiZ9V18PNNxywnRWv77zukvFejMepsPWo12/0kK2J/TRrbISq+rgaZ9fnjuSkGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wZNu5bti;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0027606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0027606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wZNu5bti
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso11454545e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793225420; x=1793830220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HdW1B+PwB8W7tgHfDp5ShqzV+29fBGj0gnB17D0W0ok=;
        b=wZNu5bti8AwxF2leLPrpv4ruSx9NfvccQQW1Z/ZBdeLdh3Mv2osH/LtiYgHqS0izp6
         qZYnlQ+ZqMGYmt4pdCLVZS2UYPG13USRyWztfBWeRHUjhKbl+fHQyZD/uKCNNkZLIuDI
         k9oJTMmbNJhIC/aQdtAcovyrfeaWNGxyYF5fw22XhAMBZ21+tjwC9KL53YE0wa3976Sk
         iLPGx74r9kkTjdFaRJmA+hvEmfrixlJdudXRYgkhe3iDzXlUg7NQwk/OpiUmCCtleJx5
         /3FV5ZFvbaj9FbKjpvmoIWdXyugvPDgJpK6tUJ9qCG1YIE0zmH8AjnokUjYc9PGEbC+W
         voQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793225420; x=1793830220;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HdW1B+PwB8W7tgHfDp5ShqzV+29fBGj0gnB17D0W0ok=;
        b=TU8DshILap9365lb5/eqY0DtdU05blW1omtiZA0RTkQFT0XOF875N77kvIU2tRZ0Au
         bE0KUWcBVyCZe6jH7dZmHS43iXkfLbVXLH5hm2+csXtxaytmGwlRgYojHjp1TVQGuhIg
         RH9K3WPN9rVR2fhS4aHn+0hw/iI8TfAdPlfKg06+pbgrSP9khC7HtNmQ/vaXPVQivSPR
         Hsi9oFC8y3h2I9yTKdaAQMVKTntR94nPToFEGLwOalft5TZ6q8+NVmmkJIKJxEguP2Jy
         S2UBZVupt3Drde052Ibg7vH0nm9j+3KrGL9m23HE8RgvMEQmuclgnf3hLDOvX9xWGtHt
         9anw==
X-Forwarded-Encrypted: i=1; AKwUvBxgdezKImR0thfdBFNIleFy++ekuhynfjLq55wSv2mcyTqmA+klKaXn9L1LFwUiorY8MwGIQ9ullG1ecMw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0im7s+gbyrK+nFoMpl99sCfZxwwfFLwi7r6V3OStZTem2pNZK
	U/B8YBPRCkFv0xyjm8w0ixpDfc6mKME7AZvT9j9EQSsqNrsou8ptSFbt
X-Gm-Gg: AYBFou3aMBuD9A4Ra0AXJ8ujV6D3ZFKhy7UX+175xeyVbFu1GqNHMOMKxrCRkzdSfBs
	qZI9DatsHtJKsP6+3QzEgf1dWEiZ44K9pWf5AhV9SPWp0SZ7rSbfUuAeD27eWLhIeFF3+VGI+ge
	K4J6KVc7ftA2hXo8RjVTCswfUrpUsA6Mz7j6vGJ4DrYFVOpnOacRFE9/+3s3U40lwerY2Qk6ru1
	DlEqWpZgJYOZ3ZRxrF7FsKJLJEA2fzTVTkTrqGioJZiqEEQZzdn24RB6BxAKWtv3pMtdaQtLwcw
	eojOVXP7wEKRS5nSDn2/atRG1fGEXWL6E6WWNjLl+Cc5G+MNNXPSnK2DKkm9R8VpL3CL6krLImy
	ERY4ZUzzTy6vR46R3JbfAo1x7Cm1v/0Cb2PAjuEULQc537NJtWcA3GYaUV1IHjaqxUt4L+P7DJM
	0HPQU7XuotbBBGdBXkrIeBNd7Zyvw6VGN2UBPqupGED8vEhE9DVZKDEX298GP1O5BjRd3NhygpC
	gCeOLvmAccFp8X10j4ePw8Vi4xmOlnowIfy72ZYQuPkr2vLnfSiE4qQh3Crojmofmhg3s/xrPB3
	mnMOJ2MRgGjgdkGmThIG5jU4icFt4z1swuUf99j5jqTKRfKAhLB4yp6p3+8D
X-Received: by 2002:a05:600c:354a:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4a9678c3ca2mr82957515e9.32.1793225420025;
        Wed, 28 Oct 2026 15:10:20 -0700 (PDT)
Received: from SurfaceArch.localdomain ([207.188.128.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb75e0sm20549145e9.10.2026.10.28.15.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:10:19 -0700 (PDT)
From: =?UTF-8?q?Antonio=20V=C3=A1zquez=20Blanco?= <antoniovazquezblanco@gmail.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dorian Stoll <dorian.stoll@tmsp.io>,
	Tomas Winkler <tomas.winkler@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mei: me: add ice lake point LP iTouch DID
Date: Wed, 28 Oct 2026 23:10:17 +0100
Message-ID: <20261028221017.54426-1-antoniovazquezblanco@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the device ID for the Intel Precise Touch & Stylus (iTouch) function
on Ice Lake Point LP. It appears as PCI device 8086:34e4, next to the
regular MEI function at 8086:34e0, on Microsoft Surface Pro 7 and
Surface Laptop 3.

Without this entry mei_me does not bind, the touch controller is
unreachable, and neither the touchscreen nor the pen work. Users
currently work around this by binding the device by hand at boot:

  echo "8086 34e4 ffffffff ffffffff 0 0 9" > \
          /sys/bus/pci/drivers/mei_me/new_id

where the trailing 9 is the mei_me_cfgs[] index of MEI_ME_PCH12_CFG.
That is fragile by construction, since the index is positional and any
reordering of the config array silently changes which config the device
gets.

This ID was first reported in June 2020, together with Sunrise Point's
0x9d3e, in "mei: me: Add itouch device IDs for SPT / ICP" [1]. That
submission was declined over the server platform ID conflict, and the
Sunrise Point half was subsequently added in commit 372a829862e5 ("mei:
me: add MEI device for SPT with ITPS capability"). Ice Lake Point was
never added.

Use MEI_ME_PCH12_CFG, matching the adjacent MEI_ICP_LP and MEI_ICP_N
entries.

Link: https://lore.kernel.org/all/20200601155954.764558-1-dorian.stoll@tmsp.io/ [1]
Signed-off-by: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>
---
Notes for review:

Built on char-misc-next (x86_64 defconfig + CONFIG_INTEL_MEI_ME=m); mei/mei-me
compile clean with no new warnings, and checkpatch --strict is clean.

I verified the resulting table entry in pci-me.o rather than just trusting the
macro: vendor=0x8086 device=0x34e4 subvendor/subdevice=PCI_ANY_ID
driver_data=9, i.e. byte-identical to what the hand-written new_id workaround
above produces. So this should be a no-op for anyone already using that, other
than making it unnecessary.

I do not have Ice Lake hardware, so this is NOT tested on a real device.

On the config choice: I used MEI_ME_PCH12_CFG to match the adjacent MEI_ICP_LP
and MEI_ICP_N entries, and because it is what users are already selecting by
hand. It does mean the device reports kind "mei" rather than "itouch" in sysfs.
The only existing Gen12 iTouch config, MEI_ME_PCH12_SPS_ITOUCH_CFG, also
carries MEI_CFG_FW_SPS_IGN and drops MEI_CFG_DMA_128, and I did not want to
assume either is correct for an LP client part, particularly as the DMA ring
is negotiated at runtime via hbm_f_dr_supported anyway. If you would prefer the
device kind reported correctly I can add a plain Gen12 iTouch config instead;
please say which you want.

 drivers/misc/mei/hw-me-regs.h | 1 +
 drivers/misc/mei/pci-me.c     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/misc/mei/hw-me-regs.h b/drivers/misc/mei/hw-me-regs.h
index b9a67629496b..3972f9504f12 100644
--- a/drivers/misc/mei/hw-me-regs.h
+++ b/drivers/misc/mei/hw-me-regs.h
@@ -94,6 +94,7 @@
 #define PCI_DEVICE_ID_INTEL_MEI_CDF        0x18D3  /* Cedar Fork */
 
 #define PCI_DEVICE_ID_INTEL_MEI_ICP_LP     0x34E0  /* Ice Lake Point LP */
+#define PCI_DEVICE_ID_INTEL_MEI_ICP_LP_3   0x34E4  /* Ice Lake Point LP 3 (iTouch) */
 #define PCI_DEVICE_ID_INTEL_MEI_ICP_N      0x38E0  /* Ice Lake Point N */
 
 #define PCI_DEVICE_ID_INTEL_MEI_JSP_N      0x4DE0  /* Jasper Lake Point N */
diff --git a/drivers/misc/mei/pci-me.c b/drivers/misc/mei/pci-me.c
index 790a4647811b..e8805bcd3695 100644
--- a/drivers/misc/mei/pci-me.c
+++ b/drivers/misc/mei/pci-me.c
@@ -98,6 +98,7 @@ static const struct pci_device_id mei_me_pci_tbl[] = {
 	{ PCI_DEVICE_DATA(INTEL, MEI_CMP_H_3, MEI_ME_PCH8_ITOUCH_CFG) },
 
 	{ PCI_DEVICE_DATA(INTEL, MEI_ICP_LP, MEI_ME_PCH12_CFG) },
+	{ PCI_DEVICE_DATA(INTEL, MEI_ICP_LP_3, MEI_ME_PCH12_CFG) },
 	{ PCI_DEVICE_DATA(INTEL, MEI_ICP_N, MEI_ME_PCH12_CFG) },
 
 	{ PCI_DEVICE_DATA(INTEL, MEI_TGP_LP, MEI_ME_PCH15_CFG) },
-- 
2.56.0

