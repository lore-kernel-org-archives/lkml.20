Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F21A39D6FC
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 09:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789290287; cv=none; b=eQ7LwsIFLSTtSby5qXMUYIacQTCbIAkHanxl8StuglDDx5pwsAc4eFm8utKbRymNCBBuFZMEdII0UlJEOYhKrozY5qF0pv3rEtIga+rD5S2O72KjxKaPbt6mo3XS2KRv8AU7xU4vVZ+eMlz42GwDHNP2w17w/csFxckwnMa2vcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789290287; c=relaxed/simple;
	bh=ZGssKccc0YmYmHMdddJCCTHXOIVCPPrC/q9SxhEUXDk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jWcgFPg5Yatn4/7pCtkcBhdk1d1Q1tHgGSAf4HEaj7hkWtBv2bb7H3AdWznEtZeadWugsdo7y+XvBwLTKotEbeD5mZi6POwOcF9NoIGtjBY2efiCCcPQR1vJGhxTuxHfV36L7Y2wGJnx3QK97sXfiyv4bRC1WSEtH9ZO9Q8+eEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-80491594629so2512905a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 02:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789290276; x=1789895076;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l1vZLOiobhXc8XbsYwzdcJanBunwjxRSoAWatzuAtCk=;
        b=fZIFsZ153kDPy/C5u1ftPQldOkexu+pJcglDPl8XfJDxSnge6AIzuQvOen5hO3/o4N
         w8AcKf0CUY5IaRrf95+gZhuGFfrghtLJ2+7QP+31tlGb38+LFwN+JxOMbAGS0wEmDsRd
         e50nr7ARr/Ilo6hNyjO2Ure1rGf1Pm3IRQXVAE2KkU9223R/OzHGW9hIDzqHq66BelH5
         Xr1Xm0Rh1XP1D296xc6HUGW703bf8q0FhW0lhvGMPPartfjMYMahyI3FvKUlK63qF0Bn
         6mr+loXvEIywzPpQmc/N+meDDhFzjZhMXa/Z9BlgFvPo0812EBcX0x/t23C1LQgjo7w/
         GGFw==
X-Gm-Message-State: AFuF++muaZcEnf7Hu59bU6G43h3QZVTCa0mjkrWPSVh/Rxv+TLOYKgnm
	UoyN5f/8nZb2N12toW9BkB982MNsuDGrfe8e016U2mqaYFVOCnhGxqM0TINGELisaqIsLMgwcPQ
	0JvlG/19AWalgVC04nKQRHzt+DyIV0SdVjui2b4Vv35USVYHi9qBY1FbbFDU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2907:b0:6b5:ec2f:356a with SMTP id
 006d021491bc7-6c3ce8c4c5emr675201eaf.27.1789290276734; Sun, 13 Sep 2026
 02:04:36 -0700 (PDT)
Date: Sun, 13 Sep 2026 02:04:36 -0700
In-Reply-To: <6a81d2e6.9ebadd4d.20b15e.001a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa66724.3aa11909.1a03b8.0000.GAE@google.com>
Subject: Forwarded: [PATCH] configfs: unhash dentry before dropping the item
From: syzbot <syzbot+2442951a6abb004df963@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] configfs: unhash dentry before dropping the item
Author: jchuang26@m.fudan.edu.cn

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 958f35cbb8955ca3fa439cd9f2092cb42414aa8c

Reported-by: syzbot+2442951a6abb004df963@syzkaller.appspotmail.com

diff --git a/drivers/gpu/drm/tiny/cirrus-qemu.c b/drivers/gpu/drm/tiny/cirrus-qemu.c
index 075221b43..f66e33f18 100644
--- a/drivers/gpu/drm/tiny/cirrus-qemu.c
+++ b/drivers/gpu/drm/tiny/cirrus-qemu.c
@@ -68,6 +68,7 @@ struct cirrus_device {
 
 	/* HW resources */
 	void __iomem		       *vram;
+	resource_size_t		       vram_size;
 	void __iomem		       *mmio;
 };
 
@@ -298,6 +299,7 @@ static const uint64_t cirrus_primary_plane_format_modifiers[] = {
 static int cirrus_primary_plane_helper_atomic_check(struct drm_plane *plane,
 						    struct drm_atomic_commit *state)
 {
+	struct cirrus_device *cirrus = to_cirrus(plane->dev);
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_framebuffer *fb = new_plane_state->fb;
 	struct drm_crtc *new_crtc = new_plane_state->crtc;
@@ -319,7 +321,7 @@ static int cirrus_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	/* validate size constraints */
 	if (fb->pitches[0] > CIRRUS_MAX_PITCH)
 		return -EINVAL;
-	else if (fb->pitches[0] > CIRRUS_VRAM_SIZE / fb->height)
+	else if (fb->pitches[0] > cirrus->vram_size / fb->height)
 		return -EINVAL;
 
 	return 0;
@@ -514,6 +516,7 @@ static int cirrus_pipe_init(struct cirrus_device *cirrus)
 static enum drm_mode_status cirrus_mode_config_mode_valid(struct drm_device *dev,
 							  const struct drm_display_mode *mode)
 {
+	struct cirrus_device *cirrus = to_cirrus(dev);
 	const struct drm_format_info *format = drm_format_info(DRM_FORMAT_XRGB8888);
 	u64 pitch;
 
@@ -525,7 +528,7 @@ static enum drm_mode_status cirrus_mode_config_mode_valid(struct drm_device *dev
 		return MODE_BAD_WIDTH;
 	if (pitch > CIRRUS_MAX_PITCH)
 		return MODE_BAD_WIDTH; /* maximum programmable pitch */
-	if (pitch > CIRRUS_VRAM_SIZE / mode->vdisplay)
+	if (pitch > cirrus->vram_size / mode->vdisplay)
 		return MODE_MEM;
 
 	return MODE_OK;
@@ -602,8 +605,10 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
 
 	dev = &cirrus->dev;
 
+	cirrus->vram_size = min_t(resource_size_t, pci_resource_len(pdev, 0),
+				 CIRRUS_VRAM_SIZE);
 	cirrus->vram = devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0),
-				    pci_resource_len(pdev, 0));
+				    cirrus->vram_size);
 	if (cirrus->vram == NULL)
 		return -ENOMEM;
 
