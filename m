Received: from outbound.mr.icloud.com (mr-2006i-snip4-11.eps.apple.com [57.103.70.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E868F12CDBE
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 01:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.70.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790904968; cv=none; b=Y778eeEz1vlfPBmTu3g+e72zXXOKK+6FYoUGSB1J8FTZcFqoooP72t/YzNDAVHMvyJd2h9R4sUo5SyWlItg/t+k6zdHbyixX3JdkXyHJFYcyGHyNH1LXuSWpjks7fy5PSzAp/VU3XM6wIGaBm2IP7qRLPXETMHoMp3f0gDHRRJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790904968; c=relaxed/simple;
	bh=NCX6I72rsB99eALfg1CbYVhbcLBTeT6QhLF8YlCwwtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tau3+HM/wm9rTDbc7q/W0muDRNdDQ7QRNFmLeh4RvIhMQSsYp4hZmXgoltHJlLiWpCuGgM8FokJc4Bt7hyNxqMshK+GqbS2uRx4NTs5dZwlnqLFPJFEUSBfvLmB2EKkwRwo5caq/AZDObAI2rYKCSkp01ni3CRaiWAiVlFDu2QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=RZIVbPlk; arc=none smtp.client-ip=57.103.70.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="RZIVbPlk"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-11 (Postfix) with ESMTPS id B33191800142;
	Fri, 02 Oct 2026 01:36:02 +0000 (UTC)
X-ICL-RepId: 01a0fa41-0e35-734f-b0f5-ffb83ee1c039
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhKCkMFWhxBDUkdXA5bEhVdRVUXUhlHGFc4Wg5bBEcUFxtcABcNVk1QG18CQg8cE1YVEx9UVgNAGRBWAVhWXQVNGlwYWQ8cHUtWWg5bBEcUFxtcABcbRgIEIwJfAEUCXglWATAXD1ZNUBtfAkIPHBNWFRMAXg8PTAtIAVsGWwJCCUkAWAdbHEEPQQNeGlofFkMdQRhfBXIZWhRcGFNFUR9URhMZThtXTVAbXwJCDw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1790904966; x=1793496966; bh=OT7TrhBf3j83+NSyRipu0I+E2qluLlwof8zeu7m4rn4=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=RZIVbPlkb0Vv7BOhnXd/C0aeEN/UBhbt27alcKQsl3Kv/CLMFNqy5i/1r4/bClYxC/kgRl3ChUdFdG+zgPr104WdbTM2B8lvYdEP+81W7N5qJHwbpOEkdpnkVRZ/barsvAuo8iZQ3QQcuIGonsFJWTll2IHE1Usvx0tffoy6i6JlZM2WdOQe1a7p3E9nK8tr9DMglnjP588qF+zgHq/S3Rd6LOHbniADkFJ/q6QSug03bszra9PqLBkHEErjdv25x6EVDRlJD29PcLdCCR0F2vHPz7DaNduOEHhraxRw43qmueEf5E1rQkDUmbA3w3OHyebczInTcMTRZ2IcunEY+g==
Received: from 252-PC-L.device.rit.edu (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-11 (Postfix) with ESMTPSA id E1CFE18002A5;
	Fri, 02 Oct 2026 01:36:00 +0000 (UTC)
From: Finn Zeruhn <fzeruhn@icloud.com>
To: dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jani.nikula@intel.com,
	contact@scrumplex.net,
	linux-kernel@vger.kernel.org,
	Finn Zeruhn <fzeruhn@icloud.com>
Subject: [PATCH] drm/edid: add non-desktop quirk for Pimax VR headsets
Date: Thu,  1 Oct 2026 21:35:00 -0400
Message-ID: <20261002013500.16903-1-fzeruhn@icloud.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VcLxTvQjpYWfbd2nmfOK8FtjqJV3gm_h
X-Proofpoint-ORIG-GUID: VcLxTvQjpYWfbd2nmfOK8FtjqJV3gm_h
X-Authority-Info-Out: v=2.4 cv=Y+71cxeN c=1 sm=1 tr=0 ts=6abf0a84
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10
 a=UWokjQvqbcQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=v3ZZPjhaAAAA:8
 a=--jmYVTuTiGZAk_VZKAA:9 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAwNiBTYWx0ZWRfX1Nd9NxieFTwx
 tFVq+0V6ZC6vRf34PrdiMI0/l6Hi6ou/4ubPnK1y0ds9sY6YJczHDf/VJYPE+4bmptJZER3Qffe
 Akd7539vqWQsUbng+A9Om0vX/asUiVTlB6L83kaqjqDm03VRSWBN+j5uYIUj6YNdRldvAZYk2tQ
 GGuyrR2yv5/7termUUaDjXsGluIYBlmEXbVRgTNWHFajj+Wnsq7JyhxaVhGVlbAcBTNZsOqMWwk
 VnOJnPxN6HvCP1Wd9t050FGUSSBQMnpb+lQeT+gXUgF1kBZ2BKYqiCM4vhxGyr3yWTu4t2I/7P+
 TOSulkdhSaUnDN5JChjSHXFSb1ljfkePbk8HYejHg4h9163yi2LNWVuL5fdm1c=
X-JNJ: AAAAAAABidaxNK+g8hIzWwsqq56ti3nXpWZZ5hdFD1l2CjfvMQi+DRtTrs0J2uG+8KqCRk
 p8pWHdYri8l5PZPrpHsGcUWy4oBZoyDeId3A1Rl8XQuFxR/iPq5I4X+1gQfb9UYCaDyXYb
 7rU4jTR+yIVjWAzD1zopJuB5IfdFbEvRdDTM5Wr9Xb9Vw4DpWWmKn9SGaHjMFUXtfDNk1U
 rq8/j+odVaeAV6l30J8ZhTaLpoB1uWes3CXMpnu2ApYQBB+LhDsMac9XIclcZNEtOjY+Zv
 9Jr0jocVRjF9QroMyFMhwxtNUtG66kN5x0C9AORWYYVU8gD00YOnRFwSFsC3u2qZIf+KJw
 GnWRjFGWY51NZZXhmILFcF5Z95q5iZ6f3wZrVHE4nlGPUgcYFwBjrSK3qtgbMRnwE1kSrP
 uePmijnS/GJKxtml0ZLXx7O74I8CDSZyFmNfi6fAUSqu7H1oDFaMoL2pmnqMe3YCYqhNs+
 Pr0eCbsFfBQgs6yRCdNnGvFovlYWMsTGNGMFYt11jO4i9UFM5Ew9E3ybUwYb6cHbgL7ppt
 l2vQwxVBc7eAdaKPdY3uLUuyeDih6KiIrdpodm/Syttzu49cmQ1GbFLP9BEmMlIrcxvSWM
 cn33/e8YHjZUVYqavxmUOJZQQlJtOoUSNhXCYmdQzkLS2lhnrreQwI8YG4T71q8t1cNVL9
 SrOapqmGRRNuplg38xQCbY+URQC9IEK3JpXoMJeWctEtjcNDk59iaz2rVmr7nLKawik4QV
 dFkBEUZuLjxPfYDSzVd710IzORNb0vNij8+sBWdWT51AoWucQuckf1U8Z5mYbOsE7hjnY4
 RzpnaL8p6hYJh9TRxkbkQHjAd4xpuUKMQCpkiuJfMApMGDsI5pj/w2WcjqM5FR+9Vh2v8+
 /imkwv3B+GfOMtl5RnQFPhNyXOqSk5SE95IzinH7CLwnVp6LeVA0EZAR+PYOA9OCNAVP2A
 xL1jUha8D2UlVpz7RRKG5GJWrBI2JfFlPYlc94KXG4YlKjHL2Y82yNVCJUo06u5Zico5vi
 3cwr1altKFmJBPUQRQXAp0+8lnjXxEB7iPD6N4xy1D/2/7/kkTgkDuGK2wV55gyEqII9vM
 VcVWJgNtLzqOJpWGiKxEMi23xOviEReSD+C/xUAsHrnJ5nx8KAZhb7qova3jS5QRO/MNSf
 rpftWHer8JwUaVM/t+R4bNtPCoZt2jrqEH+uf14XDeb8oKmrvtIWcRwVSZePAHGHUW0Bu/
 u8Na3fSD1+hKZphAhtSUVjeKXWM6MXiD3lJZpZ+NikongAq9TjrRGRHaDm9GXWZc2Sd6q0
 gxz12Xi2eOobWHSGdwMuBrYQKgXkq6Vf09jDe0xp0LaGQLfdmg
X-Apple-Category-Label: MTE1NzgzMjUxMzU6JGNhdGVnb3J5JF9QZXJzb25hbCw=

Pimax headsets reporting PVR 0x1019 do not identify themselves as
head-mounted displays in their EDID, so desktop environments treat them
as a regular monitor and extend the desktop onto them. The EDID has no
Microsoft VSDB and the DisplayID product type is 0.

Add a non-desktop quirk. The ID is shared by the modern Pimax headsets,
including the Dream Air and the P2-series P2A.

Tested on a Pimax Dream Air: the connector now reports non-desktop,
KWin leaves the output alone and offers it for DRM leasing.

EDID of the Dream Air:

00 ff ff ff ff ff ff 00 42 d2 19 10 01 00 00 00
ff 23 01 04 a5 00 00 78 00 30 fd ae 50 3b b2 23
0c 47 4a 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 00 00 00 10 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 fc 00 50
69 6d 61 78 0a 20 20 20 20 20 20 20 00 00 00 fd
08 3c 64 e9 7b ff 01 0a 20 20 20 20 20 20 02 c2

02 03 0f c0 23 09 07 07 83 01 00 00 e2 00 4a 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 42

70 12 2b 00 00 03 01 28 43 08 04 88 bf 1b bf 01
c7 80 2f 00 ff 0e 2f 00 1c 80 00 00 cf 39 03 08
bf 1b bf 01 c7 80 2f 00 ff 0e 2f 00 1c 80 00 00
dd 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 90

Link: https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/40
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Finn Zeruhn <fzeruhn@icloud.com>
---
 drivers/gpu/drm/drm_edid.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 3148038747b6..e5cadbeaaea7 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -278,6 +278,9 @@ static const struct edid_quirk {
 	EDID_QUIRK('H', 'V', 'R', 0xaa01, BIT(EDID_QUIRK_NON_DESKTOP)),
 	EDID_QUIRK('H', 'V', 'R', 0xaa02, BIT(EDID_QUIRK_NON_DESKTOP)),
 
+	/* Pimax VR Headsets */
+	EDID_QUIRK('P', 'V', 'R', 0x1019, BIT(EDID_QUIRK_NON_DESKTOP)),
+
 	/* Oculus Rift DK1, DK2, CV1 and Rift S VR Headsets */
 	EDID_QUIRK('O', 'V', 'R', 0x0001, BIT(EDID_QUIRK_NON_DESKTOP)),
 	EDID_QUIRK('O', 'V', 'R', 0x0003, BIT(EDID_QUIRK_NON_DESKTOP)),

base-commit: 589e63c53a9a57cd3c14cff2ea42ad606c1e2a24
-- 
2.56.0

