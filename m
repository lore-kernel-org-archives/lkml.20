Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E541A267
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790412211; cv=none; b=DoxAeUJLs8ncdoQpX/3I3vC8AZNGfcAo5t4x2vXiAu2KxAKLJ1NzEL7UmmDwNyisdHfviKyhCbvDz5PM+iikpDiyLMVgn2oK7jFzP9NUnq/g9oQSNsXrc0EAsqyCfRyrw87IHySj7Q8v3KQm4WsmV/AFrPjDZzIanVKfb62ql1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790412211; c=relaxed/simple;
	bh=FXZ/O9NxkMPrU9h+reZfFy89Tqxxb60b+xqI2ZJbDKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pxqv93glthR8Z/UqG4PtP/EveRGjTFURQHjy8f3N81EH2NLiDDAgZtVmjGAdYlb9kpgak3K4inzsKS/FnSTCOwKKc8VTmX7meqqO+TLqifjqkj1eUqSUtvIkAOfA1xthgcMBHPfa8TfAJ5dGqCkm+LxihjG2lnDjNDg5tNHwmDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sLt5gyoP; arc=none smtp.client-ip=74.125.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sLt5gyoP"
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so579155eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790412209; x=1791017009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjxGTnd2mKbbrlmpZXTSuvBmHY+YigrHR6jMxFwo5ms=;
        b=sLt5gyoPv7Iwgw7Qc2IIUh+/AXu33GpkrRb6iVoodfs3zlX+1RWj9u72g8RThtvsTN
         XXVSiCcIg7N7UizidnD0qBDn4ZNJ8XSPFYubSu0cHFW9RmmhpjsuB0h9bWzctovxgMG9
         39hCjTMeq0BpluKkPrKl3Xis5GS/+L56aZjtX7wUQL1R/jA0TvFG4X3lfEdg6OrYq+dO
         qOmRXIImykzPDI2AhGWIQbPWWvwyCUKcnBXCMNgqyoVdhbXMR1zNfrZ9C7MYUshwCyyW
         13jAcENpYxLPMzvl6RaKjIe1e//kvOQjJ2Tv3hX1SMmmFNW3RxlpDRKpaEVGrPTnJCtT
         J9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790412209; x=1791017009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yjxGTnd2mKbbrlmpZXTSuvBmHY+YigrHR6jMxFwo5ms=;
        b=GMbX8LvYiyp1lDXKrwmbR2hoRQXynxcQwmIhAYKgIXDeJAJOTnKWNCcsiuijR2Ia+R
         NybN3DirWIXlxSuFvtBR7E0cy8/eGGXFO1q4gGQNEEhe2/Z8VXVax4gSmFac58dWr1Bf
         USKXIlsaB9kKE4D42rk/yXMId/gVWg7ecog+b1gftZ7V69NOwOvCbojNWgG2sCTvhFlA
         WyIKaImSMLyWq3PivDhLwILwONWOsnrfeTHbhp6N1UOp1oFml3gasYWz/RMhTGB9tSYr
         xbAkuey7I8Ul6/SkQ2rdi4RWMbnQE1AQM/igmnisj5Nr8vRC9gCJAqouuw/e2JULLtkQ
         +4Sg==
X-Forwarded-Encrypted: i=1; AKwUvBw8Owwtu+4b24IAPsOJ/opSDNzkSN/KC2phM7hVRkcqnl7PPtyR7iirGs7aI880ly3di7nMYefGwwP09fI=@vger.kernel.org
X-Gm-Message-State: AFuF++l+f10r5vF+KxZs3y60FOWTuQCTft5NlCI8QtYHO23RALUra92y
	amPN83f17wYK4kUoRO2b6NL7ONkJY0UCg3GES5cY6uZES6lOGT89YjE6XN2fuv+IY8E=
X-Gm-Gg: AYBFou0yEmd3LTi+SZr/ulsCoFQ3PUd22G2fHjmHJHl56XOFPHUjpZQfP5lGuKpWLIk
	OnqW/P+s4QjOwGzAXKYV5url8eeUBqDobIrCpwg3l49BQSCmPlBFEsddIRHhTiyl9wM5o6tvQ/b
	6PmMD+u6wsQBlo9WXOJF+v5bC/IOXvAuSJwg+tqlziikwt5nvtrDUjv6+WoBuyMVb/3cyag7xq2
	k1uofhM6G/DQEEnynxe0e2X+PVB1mUBc1bhHq9IvwvLBepBWAxDk7CIWaidKbvFI5vRiN9PH632
	56855eT0tatCl0U37G0oxyabx1lmYdPwJVn6VaNVcLm6my7Od0t8WttjTwL3INtelCoAayqSzJ9
	jqyN9/Z3sJEoKXrczLl9xYmCbBDCkLDHaLQ1ZvqFBo/MH+HKyPr9ZPqogRSCvuMFrd2mm32XOZL
	Ih4BVFh4upQJNJ5FMam0ISAQh0JQBFAutEkuMjV+rMEb1yJVUW3mLvGeJPgtnjnw0YhlqvjZhAV
	MjDZCCbQ9qt8aGPxpXqgYuOKUlOiyr1k1W9GpIf+gEgnX1Tn7MdjC4=
X-Received: by 2002:a05:7301:f10:b0:33b:c69b:7074 with SMTP id 5a478bee46e88-342700be120mr2225602eec.4.1790412208861;
        Sat, 26 Sep 2026 01:43:28 -0700 (PDT)
Received: from Raccoon ([157.51.160.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3421dbb2971sm8463086eec.10.2026.09.26.01.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 01:43:28 -0700 (PDT)
From: Rohinthan P <rokinthanp03@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+caaca441bae2799984d3@syzkaller.appspotmail.com
Subject: [PATCH v2] media: vivid: check for NULL dev in vivid_probe() control setup
Date: Sat, 26 Sep 2026 14:13:18 +0530
Message-ID: <20260926084318.12161-1-rokinthanp03@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922125434.19361-1-rokinthanp03@gmail.com>
References: <20260922125434.19361-1-rokinthanp03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In vivid_probe(), after creating instances, the driver iterates
through vivid_devs[0..n_devs-1] to populate HDMI and S-Video
'Connected To' controls. However, it dereferences dev->has_vid_out
without verifying that dev is non-NULL.

If an instance fails during creation, vivid_devs[i] remains NULL,
causing a general protection fault:

    Oops: general protection fault
    KASAN: probably user-memory-access in range
    [0x0000000000005f38-0x0000000000005f3f]
    RIP: 0010:vivid_probe+0x579/0x10d0

Add NULL pointer checks in both loops in vivid_probe() before accessing
vivid_devs[i].

Fixes: d7c969f37515 ("media: vivid: Add 'Is Connected To' menu controls")
Reported-by: syzbot+caaca441bae2799984d3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=caaca441bae2799984d3
Signed-off-by: Rohinthan P <rokinthanp03@gmail.com>
---
Changes in v2:
- Remove .suppress_bind_attrs = true so driver bind/unbind via sysfs
  remains supported as required by the test-media test suite.
- Update author name to "Rohinthan P".

 drivers/media/test-drivers/vivid/vivid-core.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 62cfb5f..1860ad6 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -2116,17 +2116,19 @@ static int vivid_probe(struct platform_device *pdev)
 	for (int i = 0; i < n_devs; i++) {
 		struct vivid_dev *dev = vivid_devs[i];
 
+		if (!dev)
+			continue;
 		if (!dev->has_vid_out)
 			continue;
 		for (int j = 0; j < dev->num_outputs && hdmi_count < MAX_MENU_ITEMS; ++j) {
 			if (dev->output_type[j] == HDMI) {
-				vivid_ctrl_hdmi_to_output_instance[hdmi_count] = vivid_devs[i];
+				vivid_ctrl_hdmi_to_output_instance[hdmi_count] = dev;
 				vivid_ctrl_hdmi_to_output_index[hdmi_count++] = j;
 			}
 		}
 		for (int j = 0; j < dev->num_outputs && svid_count < MAX_MENU_ITEMS; ++j) {
 			if (dev->output_type[j] == SVID) {
-				vivid_ctrl_svid_to_output_instance[svid_count] = vivid_devs[i];
+				vivid_ctrl_svid_to_output_instance[svid_count] = dev;
 				vivid_ctrl_svid_to_output_index[svid_count++] = j;
 			}
 		}
@@ -2134,13 +2136,17 @@ static int vivid_probe(struct platform_device *pdev)
 	hdmi_count = min(hdmi_count, MAX_MENU_ITEMS);
 	svid_count = min(svid_count, MAX_MENU_ITEMS);
 	for (int i = 0; i < n_devs; i++) {
-		for (int j = 0; j < vivid_devs[i]->num_hdmi_inputs; j++) {
-			struct v4l2_ctrl *c = vivid_devs[i]->ctrl_hdmi_to_output[j];
+		struct vivid_dev *dev = vivid_devs[i];
+
+		if (!dev)
+			continue;
+		for (int j = 0; j < dev->num_hdmi_inputs; j++) {
+			struct v4l2_ctrl *c = dev->ctrl_hdmi_to_output[j];
 
 			v4l2_ctrl_modify_range(c, c->minimum, hdmi_count - 1, 0, c->default_value);
 		}
-		for (int j = 0; j < vivid_devs[i]->num_svid_inputs; j++) {
-			struct v4l2_ctrl *c = vivid_devs[i]->ctrl_svid_to_output[j];
+		for (int j = 0; j < dev->num_svid_inputs; j++) {
+			struct v4l2_ctrl *c = dev->ctrl_svid_to_output[j];
 
 			v4l2_ctrl_modify_range(c, c->minimum, svid_count - 1, 0, c->default_value);
 		}
-- 
2.53.0

