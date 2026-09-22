Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7AC55D87D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087345; cv=none; b=pxcb01UTCEwT7jqhC53YP7YZAykvCOTXFDF4qv7Vve3xWtb17zmHgfeDZznLI3f2tyleYs7hMYi6Atmej7orUyXjiBXqWIRgoqpLzyh8td1J7SJjKkwm5cJB78TuOsVlY1PjLBn/7s0wwo1blDLdI8iLwKeTEob2CqOd8DpPZQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087345; c=relaxed/simple;
	bh=c7JTgkgxiJZzFcL8GFK3Qn5+caW0zeCIOU8xJz6971E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bHT21DGswVPWhf/Xfhew3OVVe0i+QtZ6ye1z9j9Boc6UB8kVDXVNYETy+AFtqf9//uyVqFN6Hc0Y59i59CqMJGulAKq5qeHv9ApkKAXpa7rZ1dZaQ7tTrA4TTxppbiP23CWazdZD5NUogf2uHPpT35qIgOpIvHsgr+YHjcadeCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/HmVCAm; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/HmVCAm"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c3b639adbcso3279107b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087343; x=1790692143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeGWyXRyZoZYh2jsPiBOqtY72lLN35VvTEYYsvF2fT4=;
        b=C/HmVCAmc325FCdDxGC47T9vrwN6uHt3G2JnmPUspZIDSFiHDOogL1BD2p9Q3igyKQ
         r3tah1fXxI4V9aSF9ULievvRSjwq4/wdq8kPtVBMSf4Qnf+qjHHCkxHyCqVXwU50IMO8
         Mej3S35j3NANmHphAr4TnZpKzsO+9fJ2i4psNl1G3UTkFMo5fBCAySrXpCJtAyF/pj5W
         kEV971d3rX8kyDlMEHTZeFAqh25NPIkbhCq1AkHWoEKet3miZYvVcgPHP75XNkikoVru
         r9641US6fsTcV8VmhrdUxNGH20MwOzYimO0g7i8JKLxGZFAgBvc90cjnmYZoytr41FYe
         IsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087343; x=1790692143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeGWyXRyZoZYh2jsPiBOqtY72lLN35VvTEYYsvF2fT4=;
        b=yw3eVC15ZjhtZsdNTH8sIlY7F8+EcLllcPgAIvvK8S8Xl7TCIhEO4su/OVK/Gi8bVJ
         nXdFsz4FegqHgD2r8KFprydeDJSy6qcX2ySRSwCJi9L1lzW9TP6LXC1xZBoVBLkA9Ir5
         LbTtgO3M+6ZYaaGmm0q/R+ZR5IXpl/ZW2hUiS8i5C9/4tGbOXh0Ao6nGQGxONSmi0lKq
         M2gyKkT+MACl0CjKPEfEz+3dt8QFQ3CVgNRF6eJoHUETrTPhtbVmtx2aazwADEEbFOVP
         7ACn40Gs+frtxBXmRLkrOXTP4ALJ2Ke51pTSeM0AqbVlc8COnouXjsEfQ+l6YPpvFU8G
         Z5gA==
X-Forwarded-Encrypted: i=1; AKwUvBwE8Tz+FlCAN9NqqZulwlZD+GGxPN7/e3xR6LVlyUmaXBM01tI9kbIFS3hvAYUAvcX/zxVirfIVp9kQILY=@vger.kernel.org
X-Gm-Message-State: AFuF++leGZHb1Mhxwbmjl4wrM5p6AzBiz75KEd0I1WiFohjOcXPs6XJf
	Un5m6U5uAG8YjncIGFd/JfZEC9z4nwcdyZ8e0VOqpIh+BIXp0jQ5G6Gn5f79c5BX
X-Gm-Gg: AYBFou0YWQ1i/Hn78kPM4dDQosV8CHk6MjTKTdgzXBMMN1oYlAJGZa4ZLpyLW9e654p
	qqWV1MoxQLi6hUKaIkGiO0sE9w5UYAeiA7SdMaQXLmuSMqij4q9/Is+fVrlpDlXJMnuaISBgZTr
	LPggozsQMfeucOc64rMXYrw76N/z4DQbzTBGNAGSEjGHRCXBBhhTz10fSFNugCiihSu7BScW9c4
	5LT5bf9YDtOqzTYTXiOLEcfF5HuJDk3hXcXeLAmW/1T671zE82oFIgT6HMpwZGdV0TrgumE0KBC
	Amwydx5k0+8zI9D9x2D+KPFidKWnvzkQqk7N+luYhEbFev0mL14oVH5F2spa5sK+7zftqOcc+wP
	jqWUfWI6lvNKx4QZd4kk8z/HeRVb6Wwc/PUzO4HFQxAYyMrvhT66Ar0ush/JS0xHTYhiExf/EtT
	1MCL/TVlv8GKS/vigV2e+1tjTnAYJfohyAxLMIHqeN0VDMa68n1U1Aq45EPrBpLaSgNuJm6Wi5e
	mgq+b7F3k3dW4j8sJ5oWHRZ4Dr7+nuwx9bGPC6L7sMeqzvCOCwg/xxipja5sONGh5cSgvbUMhFa
	KZx0KbBt2xCO3zI+GX8dXsJDvUz67YQ58nVIxzTRNBLqPGZUo4Oa3j8w2w==
X-Received: by 2002:a05:6808:30a0:b0:4c5:4eed:b447 with SMTP id 5614622812f47-4ccf6a74ebcmr15126478b6e.1.1790087342564;
        Tue, 22 Sep 2026 07:29:02 -0700 (PDT)
Received: from ututo.. ([2803:9810:87dd:de10:611b:6da3:8cff:cdf1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d4c0dd2244sm1467147b6e.8.2026.09.22.07.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:29:01 -0700 (PDT)
From: Lucas Costa <2000.costalucas@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lucas Costa <2000.costalucas@gmail.com>
Subject: [PATCH v2] staging: sm750fb: free cmap on framebuffer release
Date: Tue, 22 Sep 2026 11:28:51 -0300
Message-ID: <20260922142851.46724-1-2000.costalucas@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922035302.167378-1-2000.costalucas@gmail.com>
References: <20260922035302.167378-1-2000.costalucas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cmap is allocated by lynxfb_set_fbinfo() but never freed, so it is
leaked when the framebuffer is torn down.  This happens on every unbind,
and on the register_framebuffer() error path in
sm750fb_framebuffer_alloc().

Add a lynxfb_unset_fbinfo() cleanup counterpart to lynxfb_set_fbinfo()
which deallocates the cmap, and call it on teardown.  In the alloc error
path it is only called once lynxfb_set_fbinfo() has succeeded, so the
cmap is only freed when it was actually allocated.

Fixes: 81dee67e215b ("staging: sm750fb: add sm750 to staging")
Suggested-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Lucas Costa <2000.costalucas@gmail.com>
---
v2:
 - Move the cmap deallocation into a lynxfb_unset_fbinfo() cleanup
   counterpart to lynxfb_set_fbinfo(), instead of open-coding
   fb_dealloc_cmap() at each call site.
 - In the alloc error path, only unwind the cmap once
   lynxfb_set_fbinfo() has succeeded (Dan Carpenter).

 drivers/staging/sm750fb/sm750.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 8b93bfeb217b..68b6d4fe79ca 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -825,6 +825,11 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	return ret;
 }
 
+static void lynxfb_unset_fbinfo(struct fb_info *info)
+{
+	fb_dealloc_cmap(&info->cmap);
+}
+
 /*	chip specific g_option configuration routine */
 static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 {
@@ -910,6 +915,7 @@ static void sm750fb_framebuffer_release(struct sm750_dev *sm750_dev)
 	while (sm750_dev->fb_count) {
 		fb_info = sm750_dev->fbinfo[sm750_dev->fb_count - 1];
 		unregister_framebuffer(fb_info);
+		lynxfb_unset_fbinfo(fb_info);
 		framebuffer_release(fb_info);
 		sm750_dev->fb_count--;
 	}
@@ -936,12 +942,14 @@ static int sm750fb_framebuffer_alloc(struct sm750_dev *sm750_dev, int fbidx)
 
 	err = register_framebuffer(fb_info);
 	if (err < 0)
-		goto release_fb;
+		goto unset_fb;
 
 	sm750_dev->fb_count++;
 
 	return 0;
 
+unset_fb:
+	lynxfb_unset_fbinfo(fb_info);
 release_fb:
 	framebuffer_release(fb_info);
 	return err;
-- 
2.43.0

