Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794028550;
	b=NwnHGz/ed44kvj3FzTcbyrmWuC4xMhQzsM/JTkdo05gnzVFndnk/Ve6EUsQ4b90oVd9G
	 ypooZjQE6nQX9l8/IKQbMy4l2Aab7/bhdvsxH6lx9Kgh3HEjTmHUBqQOBKHsNTt0X2JFT
	 OjY+UWD7MiWnwyd0Bm5MS70OiJG7C4Lmr9GZWELKc8gCJnLjt3gkOspFiteJuiTdEOzSo
	 k4NyPcNvcUW3Gf9A/TqohJ2xX9ZQgnG36AVF5kO6uLHvRuPvu4jpqntrYUTNcpHCztj6h
	 jN9YjciWZIysi2xjgw709D/H0dHUABSFNpI3myge59QGOjykv7oLVtXByw5G5+46KBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794028550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jmxPKZdB+EF1qgGP3ZUQ8u4MlAN02FK6olWNDMDucV8=;
	b=PdXKTnBIilba1CD8n7rTkQ19n0WtL05YB72heolOLj9lNdrlld88kCCaaD3EF1zj7uLJ
	 /g5eyovOvWf7m/D06QpeRpKIa98b7XzG/xrOsvL4KuuW4wpIFUMWW51wzjSXR0r/RjciP
	 UYRDVa3mlncFQTvEoz9qeTHT1qsinJlHl9TzjdcedrPJFdtUONSGCSZ+YBk1CIXEajtBg
	 Ask054eW7WcND94dbUj+OaYhQPnvG9mXywG2qhc6ORQMy2aGPAXxf47BJRi2BL5DGBMYW
	 rpX3KfjkFuUh+guJ0mVoKSMw3qHYDOJS5C6Bt51qL2izJVMyR3MiJBTM8IVcGofgSCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w7r4brYn;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8069C606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8069C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w7r4brYn
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-14fc585291cso1138931c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 21:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794028548; x=1794633348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmxPKZdB+EF1qgGP3ZUQ8u4MlAN02FK6olWNDMDucV8=;
        b=w7r4brYn558hU4g58wpK7bJDDz3Fl8yx92oOU8uCQnTz0qITLEEvlJsa1ykvcHtq1b
         oG8FowUv4/0ghIt1lnlQdTbE9rczhqyeRX7Zh7gY3mjwoLdVMB4bLhTw/1roWqll9h6o
         nisVAEIQnWF35CJdFB1YBwrjpyzd7Y835nuMtk5k0zrDIw4TXwFjKabGaHzcCCGa5LSS
         du/O1MxJBDDjH0irw4/bLDzLTkxSt8M5828QXwL0C9D/WgMis2VCRN4TAmprn+lZwMKK
         KrbnsCK9WVoQ3VtRHBT41oVZwAXWOnbDwaSmOp0nY/KPYuPoBMAMfn5kVLf/t8ZmdMSl
         fY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794028548; x=1794633348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jmxPKZdB+EF1qgGP3ZUQ8u4MlAN02FK6olWNDMDucV8=;
        b=oFdnFmw3GXeQWsBmtk+kOJDqVoB31lchRVXodzBGcabf+efHO7qZyp7EbYK+HsSePZ
         ytvU6+aSuYi/qx3RZsDwlNIwVRJE9bWe636wnCZWK3ufFo7YLUQ2CLdphPRbvtddNLsk
         GlmSYxv5mmSUPatmkStAVwMjHUG0ZAbAgWTgWX5PYv6ivFLphsp2VzbikWqw8LaS05ie
         5dYFa7I2lNS3O3/ckW86yUQWkSy3Rfi5OIqRSitbtu8oSE9XmAQtC9NxvQ9jW4WCH0NR
         z8Cw1Q7ezEAmb/1mq3AOSCgFa6eOi43wfqU6/fJqOhdmZL4C+OLrUwmjcuHoBIgrCf5n
         xavg==
X-Forwarded-Encrypted: i=1; AKwUvBxzZomh22vYg4bBgjzVeV2SWyMfeVhRGeM6e0FOql6Xt1TU9DWr0+QMYiabyphKqFfQ3DU/vdBBDGWz9XU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/A+Zs6Stj0U2CojmSXo9z6nvMjFTWq4cbz1KblhTF/39sp8gh3
	SaTPlCwepKTjWzXDgjkilyMSnaGXJZ9XzcJemcfsH6jBEGUqwhOXRGCW
X-Gm-Gg: AYBFou29+n0RsJ5aT2+SD+sgDFAyfr6f6cgqG1GnoSEX/NTIh9wJ4nVxUzfTfx48VLo
	4PBgtLvhSkve9oKZTdxbwi1D3jRZHBs6Bz1v3Tb9bixLBgzCwLfKuAJ1TWe1FNWgXt0OYCQ96RW
	q5935eUvwJlrzGnF4m3OKJot+0IgAFTo0OLN1yW4Lj70LEpYHZjjayzlU1YhsKxWMleKm7m7632
	0Wp8giNyZ4cTnj7UrGB+RTPE7YPeQtAnJY7LyKQ7YYQ0LsudjNAQQbq7YUNfY7/uTuCTRGZq4mo
	mRCH2MCTh9iuY/NlOwKNwuONekXDPs6S2NduudxQbc4q3i4WpfoF0WA9Pln3RRVQODQyVQaELrt
	yOVtATu9sv/wr2MkEzN96mPvKHwkwW2mbXlOSbEZZT41FP3TGAcWaPIe0eOoAXQl1xl2FFW9lsf
	Xe0NaaSr95po0JxlWIthTbWGrbuGbO0daGQhUhbp8KakBS3W9MLWkq28kONS9rIpx6M/UrV3cS4
	YGOO/Q1DH8V4hQVlUFqEduTIl7FKR8yC7DF1VfwZ3LoY4EIxVIPiYggQX1AiZMGtiJ46F0JsNsA
	1Kz+8/mkt7Rw/sddABVn4lb6CCKvRhxU05W3RedMgGSOY3z3xgGP0JSM3/ny/V4u46lGdN8UAhN
	WeJrsPQ==
X-Received: by 2002:a05:7022:170a:b0:143:8860:afa1 with SMTP id a92af1059eb24-1b25d3493b0mr4857755c88.46.1794028547926;
        Fri, 06 Nov 2026 21:15:47 -0800 (PST)
Received: from localhost.localdomain (c-73-158-21-37.hsd1.ca.comcast.net. [73.158.21.37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e261962sm15112331c88.0.2026.11.06.21.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:15:47 -0800 (PST)
From: Saad Varshani <varshanisaad@gmail.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Saad Varshani <varshanisaad@gmail.com>,
	syzbot+300213c2b5b55c0244f4@syzkaller.appspotmail.com
Subject: [PATCH v6] usb: gadget: uvc: Fix deadlocks in uvcg_configfs attribute callbacks
Date: Fri,  6 Nov 2026 21:15:44 -0800
Message-ID: <20261107051544.4381-1-varshanisaad@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106020727.6055-1-varshanisaad@gmail.com>
References: <20261106020727.6055-1-varshanisaad@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed su_mutex locking in the function uvcg_extension_bm_controls_store.
Done this due to the deadlock caused by the mutex conflict in
fs/configfs_write_iter. Validated commit with the C repro provided by
syzbot. No other conficts observed.

Also removed the su_mutex in the other attribute extension functions.
Such as uvcg_extension_b_control_size_store. This applies to all
uvcg_configfs attribute store/show functions.

The deadlock was happening due to a circular mutex dependency between
configfs (frag_sem) and uvcg_extension su_mutex. The reason it is safe
to traverse item->ci_parent without su_mutex is because
configfs_write_iter() calls flush_write_buffer() which calls the
attribute function, holding frag_sem. Which prevents configfs_rmdir()
from unlinking the item or its ci_parent hierarchy

Also reordered fmt->linked in uvcg_frame_b_frame_index_show() to be
under the &opts->lock. As well as reorder refcnt in uvcg_color_matching
store to be under &opts->lock.

Applied opts->lock mutex, to functions uvcg_format_allow_link(),
uvcg_format_drop_link(), uvcg_uncompressed_make(), uvcg_mjpeg_make(),
and uvcg_framebased_make() due to them also modifying
color_match->refcnt, to avoid concurrency issues.

---
v6 changes:
	- Fix compiler errors introduced in v5, due to forgetting to
	  test compile, and add the required variables to the modified
	  functions.

Reported-by: syzbot+300213c2b5b55c0244f4@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=300213c2b5b55c0244f4
Signed-off-by: Saad Varshani <varshanisaad@gmail.com>
---
 drivers/usb/gadget/function/uvc_configfs.c | 293 ++++-----------------
 1 file changed, 51 insertions(+), 242 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 70a1415ea401..6b85e4d61d64 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -191,11 +191,8 @@ static ssize_t uvcg_control_header_##cname##_show(			\
 	struct uvcg_control_header *ch = to_uvcg_control_header(item);	\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &ch->item.ci_group->cg_subsys->su_mutex;\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = ch->item.ci_parent->ci_parent->ci_parent;		\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -203,7 +200,6 @@ static ssize_t uvcg_control_header_##cname##_show(			\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(ch->desc.aname));\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -214,12 +210,9 @@ uvcg_control_header_##cname##_store(struct config_item *item,		\
 	struct uvcg_control_header *ch = to_uvcg_control_header(item);	\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &ch->item.ci_group->cg_subsys->su_mutex;\
 	int ret;							\
 	u##bits num;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = ch->item.ci_parent->ci_parent->ci_parent;		\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -241,7 +234,6 @@ uvcg_control_header_##cname##_store(struct config_item *item,		\
 	ret = len;							\
 end:									\
 	mutex_unlock(&opts->lock);					\
-	mutex_unlock(su_mutex);						\
 	return ret;							\
 }									\
 									\
@@ -309,12 +301,9 @@ static ssize_t uvcg_default_processing_##cname##_show(			\
 	struct config_group *group = to_config_group(item);		\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
 	struct uvc_processing_unit_descriptor *pd;			\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;	\
 	opts = to_f_uvc_opts(opts_item);				\
 	pd = &opts->uvc_processing;					\
@@ -323,7 +312,6 @@ static ssize_t uvcg_default_processing_##cname##_show(			\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(pd->aname));	\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -340,7 +328,6 @@ static ssize_t uvcg_default_processing_bm_controls_store(
 	struct config_item *item, const char *page, size_t len)
 {
 	struct config_group *group = to_config_group(item);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvc_processing_unit_descriptor *pd;
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
@@ -348,8 +335,6 @@ static ssize_t uvcg_default_processing_bm_controls_store(
 	unsigned int i;
 	int ret, n = 0;
 
-	mutex_lock(su_mutex);
-
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 	pd = &opts->uvc_processing;
@@ -390,7 +375,6 @@ static ssize_t uvcg_default_processing_bm_controls_store(
 	kfree(bm_controls);
 unlock:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -400,13 +384,10 @@ static ssize_t uvcg_default_processing_bm_controls_show(
 	struct config_group *group = to_config_group(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvc_processing_unit_descriptor *pd;
 	int result, i;
 	char *pg = page;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 	pd = &opts->uvc_processing;
@@ -418,8 +399,6 @@ static ssize_t uvcg_default_processing_bm_controls_show(
 	}
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return result;
 }
 
@@ -470,12 +449,9 @@ static ssize_t uvcg_default_camera_##cname##_show(			\
 	struct config_group *group = to_config_group(item);		\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
 	struct uvc_camera_terminal_descriptor *cd;			\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent->	\
 			ci_parent;					\
 	opts = to_f_uvc_opts(opts_item);				\
@@ -485,8 +461,6 @@ static ssize_t uvcg_default_camera_##cname##_show(			\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(cd->aname));	\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
-									\
 	return result;							\
 }									\
 									\
@@ -509,7 +483,6 @@ static ssize_t uvcg_default_camera_bm_controls_store(
 	struct config_item *item, const char *page, size_t len)
 {
 	struct config_group *group = to_config_group(item);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvc_camera_terminal_descriptor *cd;
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
@@ -517,8 +490,6 @@ static ssize_t uvcg_default_camera_bm_controls_store(
 	unsigned int i;
 	int ret, n = 0;
 
-	mutex_lock(su_mutex);
-
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent->
 			ci_parent;
 	opts = to_f_uvc_opts(opts_item);
@@ -560,7 +531,6 @@ static ssize_t uvcg_default_camera_bm_controls_store(
 	kfree(bm_controls);
 unlock:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -570,13 +540,10 @@ static ssize_t uvcg_default_camera_bm_controls_show(
 	struct config_group *group = to_config_group(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvc_camera_terminal_descriptor *cd;
 	int result, i;
 	char *pg = page;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent->
 			ci_parent;
 	opts = to_f_uvc_opts(opts_item);
@@ -588,8 +555,6 @@ static ssize_t uvcg_default_camera_bm_controls_show(
 		pg = page + result;
 	}
 	mutex_unlock(&opts->lock);
-
-	mutex_unlock(su_mutex);
 	return result;
 }
 
@@ -643,12 +608,9 @@ static ssize_t uvcg_default_output_##cname##_show(			\
 	struct config_group *group = to_config_group(item);		\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
 	struct uvc_output_terminal_descriptor *cd;			\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = group->cg_item.ci_parent->ci_parent->		\
 			ci_parent->ci_parent;				\
 	opts = to_f_uvc_opts(opts_item);				\
@@ -658,8 +620,6 @@ static ssize_t uvcg_default_output_##cname##_show(			\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(cd->aname));	\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
-									\
 	return result;							\
 }									\
 									\
@@ -678,12 +638,9 @@ static ssize_t uvcg_default_output_b_source_id_show(struct config_item *item,
 	struct config_group *group = to_config_group(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvc_output_terminal_descriptor *cd;
 	int result;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = group->cg_item.ci_parent->ci_parent->
 			ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
@@ -693,8 +650,6 @@ static ssize_t uvcg_default_output_b_source_id_show(struct config_item *item,
 	result = sprintf(page, "%u\n", le8_to_cpu(cd->bSourceID));
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return result;
 }
 
@@ -704,7 +659,6 @@ static ssize_t uvcg_default_output_b_source_id_store(struct config_item *item,
 	struct config_group *group = to_config_group(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvc_output_terminal_descriptor *cd;
 	int result;
 	u8 num;
@@ -713,8 +667,6 @@ static ssize_t uvcg_default_output_b_source_id_store(struct config_item *item,
 	if (result)
 		return result;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = group->cg_item.ci_parent->ci_parent->
 			ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
@@ -724,8 +676,6 @@ static ssize_t uvcg_default_output_b_source_id_store(struct config_item *item,
 	cd->bSourceID = num;
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return len;
 }
 UVC_ATTR(uvcg_default_output_, b_source_id, bSourceID);
@@ -789,15 +739,11 @@ static const struct uvcg_config_group_type uvcg_terminal_grp_type = {
 static ssize_t uvcg_extension_##cname##_show(struct config_item *item,	\
 					     char *page)		\
 {									\
-	struct config_group *group = to_config_group(item->ci_parent);	\
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
 	struct uvcg_extension *xu = to_uvcg_extension(item);		\
 	struct config_item *opts_item;					\
 	struct f_uvc_opts *opts;					\
 	int ret;							\
 									\
-	mutex_lock(su_mutex);						\
-									\
 	opts_item = item->ci_parent->ci_parent->ci_parent;		\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -805,8 +751,6 @@ static ssize_t uvcg_extension_##cname##_show(struct config_item *item,	\
 	ret = sprintf(page, "%u\n", xu->desc.aname);			\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
-									\
 	return ret;							\
 }									\
 UVC_ATTR##ro(uvcg_extension_, cname, aname)
@@ -818,8 +762,6 @@ UVCG_EXTENSION_ATTR(i_extension, iExtension, _RO);
 static ssize_t uvcg_extension_b_num_controls_store(struct config_item *item,
 						   const char *page, size_t len)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
@@ -830,8 +772,6 @@ static ssize_t uvcg_extension_b_num_controls_store(struct config_item *item,
 	if (ret)
 		return ret;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -839,8 +779,6 @@ static ssize_t uvcg_extension_b_num_controls_store(struct config_item *item,
 	xu->desc.bNumControls = num;
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return len;
 }
 UVCG_EXTENSION_ATTR(b_num_controls, bNumControls);
@@ -852,8 +790,6 @@ UVCG_EXTENSION_ATTR(b_num_controls, bNumControls);
 static ssize_t uvcg_extension_b_nr_in_pins_store(struct config_item *item,
 						 const char *page, size_t len)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
@@ -865,8 +801,6 @@ static ssize_t uvcg_extension_b_nr_in_pins_store(struct config_item *item,
 	if (ret)
 		return ret;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -893,7 +827,6 @@ static ssize_t uvcg_extension_b_nr_in_pins_store(struct config_item *item,
 
 unlock:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 UVCG_EXTENSION_ATTR(b_nr_in_pins, bNrInPins);
@@ -905,8 +838,6 @@ UVCG_EXTENSION_ATTR(b_nr_in_pins, bNrInPins);
 static ssize_t uvcg_extension_b_control_size_store(struct config_item *item,
 						   const char *page, size_t len)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
@@ -918,8 +849,6 @@ static ssize_t uvcg_extension_b_control_size_store(struct config_item *item,
 	if (ret)
 		return ret;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -946,7 +875,6 @@ static ssize_t uvcg_extension_b_control_size_store(struct config_item *item,
 
 unlock:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -955,14 +883,10 @@ UVCG_EXTENSION_ATTR(b_control_size, bControlSize);
 static ssize_t uvcg_extension_guid_extension_code_show(struct config_item *item,
 						       char *page)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -970,23 +894,17 @@ static ssize_t uvcg_extension_guid_extension_code_show(struct config_item *item,
 	memcpy(page, xu->desc.guidExtensionCode, sizeof(xu->desc.guidExtensionCode));
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return sizeof(xu->desc.guidExtensionCode);
 }
 
 static ssize_t uvcg_extension_guid_extension_code_store(struct config_item *item,
 							const char *page, size_t len)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	int ret;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -995,8 +913,6 @@ static ssize_t uvcg_extension_guid_extension_code_store(struct config_item *item
 	       min(sizeof(xu->desc.guidExtensionCode), len));
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	ret = sizeof(xu->desc.guidExtensionCode);
 
 	return ret;
@@ -1007,16 +923,12 @@ UVC_ATTR(uvcg_extension_, guid_extension_code, guidExtensionCode);
 static ssize_t uvcg_extension_ba_source_id_show(struct config_item *item,
 						char *page)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	char *pg = page;
 	int ret, i;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1027,24 +939,18 @@ static ssize_t uvcg_extension_ba_source_id_show(struct config_item *item,
 	}
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return ret;
 }
 
 static ssize_t uvcg_extension_ba_source_id_store(struct config_item *item,
 						 const char *page, size_t len)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	u8 *source_ids, *iter;
 	int ret, n = 0;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1078,7 +984,6 @@ static ssize_t uvcg_extension_ba_source_id_store(struct config_item *item,
 
 unlock:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 UVC_ATTR(uvcg_extension_, ba_source_id, baSourceID);
@@ -1086,16 +991,12 @@ UVC_ATTR(uvcg_extension_, ba_source_id, baSourceID);
 static ssize_t uvcg_extension_bm_controls_show(struct config_item *item,
 					       char *page)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	char *pg = page;
 	int ret, i;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1106,24 +1007,18 @@ static ssize_t uvcg_extension_bm_controls_show(struct config_item *item,
 	}
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return ret;
 }
 
 static ssize_t uvcg_extension_bm_controls_store(struct config_item *item,
 						const char *page, size_t len)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	u8 *bm_controls, *iter;
 	int ret, n = 0;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1157,7 +1052,6 @@ static ssize_t uvcg_extension_bm_controls_store(struct config_item *item,
 
 unlock:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -1467,14 +1361,10 @@ static const struct uvcg_config_group_type uvcg_control_class_grp_type = {
 static ssize_t uvcg_default_control_b_interface_number_show(
 	struct config_item *item, char *page)
 {
-	struct config_group *group = to_config_group(item);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	int result = 0;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = item->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1482,8 +1372,6 @@ static ssize_t uvcg_default_control_b_interface_number_show(
 	result += sprintf(page, "%u\n", opts->control_interface);
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return result;
 }
 
@@ -1492,14 +1380,10 @@ UVC_ATTR_RO(uvcg_default_control_, b_interface_number, bInterfaceNumber);
 static ssize_t uvcg_default_control_enable_interrupt_ep_show(
 	struct config_item *item, char *page)
 {
-	struct config_group *group = to_config_group(item);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	int result = 0;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = item->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1507,16 +1391,12 @@ static ssize_t uvcg_default_control_enable_interrupt_ep_show(
 	result += sprintf(page, "%u\n", opts->enable_interrupt_ep);
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return result;
 }
 
 static ssize_t uvcg_default_control_enable_interrupt_ep_store(
 	struct config_item *item, const char *page, size_t len)
 {
-	struct config_group *group = to_config_group(item);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	ssize_t ret;
@@ -1526,8 +1406,6 @@ static ssize_t uvcg_default_control_enable_interrupt_ep_store(
 	if (ret)
 		return ret;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = item->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1535,8 +1413,6 @@ static ssize_t uvcg_default_control_enable_interrupt_ep_store(
 	opts->enable_interrupt_ep = num;
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return len;
 }
 UVC_ATTR(uvcg_default_control_, enable_interrupt_ep, enable_interrupt_ep);
@@ -1605,10 +1481,17 @@ static int uvcg_format_allow_link(struct config_item *src, struct config_item *t
 	struct uvcg_color_matching *color_matching_desc;
 	struct config_item *streaming, *color_matching;
 	struct uvcg_format *fmt;
+	struct f_uvc_opts *opts;
+	struct config_item *opts_item;
 	int ret = 0;
 
 	mutex_lock(su_mutex);
 
+	opts_item = src->ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
+
 	streaming = src->ci_parent->ci_parent;
 	color_matching = config_group_find_item(to_config_group(streaming), "color_matching");
 	if (!color_matching || color_matching != tgt->ci_parent) {
@@ -1637,6 +1520,7 @@ static int uvcg_format_allow_link(struct config_item *src, struct config_item *t
 
 out_put_cm:
 	config_item_put(color_matching);
+	mutex_unlock(&opts->lock);
 	mutex_unlock(su_mutex);
 
 	return ret;
@@ -1648,9 +1532,16 @@ static void uvcg_format_drop_link(struct config_item *src, struct config_item *t
 	struct uvcg_color_matching *color_matching_desc;
 	struct config_item *streaming;
 	struct uvcg_format *fmt;
+	struct f_uvc_opts *opts;
+	struct config_item *opts_item;
 
 	mutex_lock(su_mutex);
 
+	opts_item = src->ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
+
 	color_matching_desc = to_uvcg_color_matching(to_config_group(tgt));
 	color_matching_desc->refcnt--;
 
@@ -1661,6 +1552,7 @@ static void uvcg_format_drop_link(struct config_item *src, struct config_item *t
 	fmt->color_matching = color_matching_desc;
 	color_matching_desc->refcnt++;
 
+	mutex_unlock(&opts->lock);
 	mutex_unlock(su_mutex);
 }
 
@@ -1674,12 +1566,9 @@ static ssize_t uvcg_format_bma_controls_show(struct uvcg_format *f, char *page)
 {
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &f->group.cg_subsys->su_mutex;
 	int result, i;
 	char *pg = page;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = f->group.cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1691,8 +1580,6 @@ static ssize_t uvcg_format_bma_controls_show(struct uvcg_format *f, char *page)
 		pg = page + result;
 	}
 	mutex_unlock(&opts->lock);
-
-	mutex_unlock(su_mutex);
 	return result;
 }
 
@@ -1701,11 +1588,8 @@ static ssize_t uvcg_format_bma_controls_store(struct uvcg_format *ch,
 {
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &ch->group.cg_subsys->su_mutex;
 	int ret = -EINVAL;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = ch->group.cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1724,7 +1608,6 @@ static ssize_t uvcg_format_bma_controls_store(struct uvcg_format *ch,
 	ret = len;
 end:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -1853,19 +1736,14 @@ static ssize_t uvcg_streaming_header_##cname##_show(			\
 	struct uvcg_streaming_header *sh = to_uvcg_streaming_header(item); \
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &sh->item.ci_group->cg_subsys->su_mutex;\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = sh->item.ci_parent->ci_parent->ci_parent;		\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
 	mutex_lock(&opts->lock);					\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(sh->desc.aname));\
 	mutex_unlock(&opts->lock);					\
-									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -1937,11 +1815,8 @@ static ssize_t uvcg_frame_##cname##_show(struct config_item *item, char *page)\
 	struct uvcg_frame *f = to_uvcg_frame(item);			\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &f->item.ci_group->cg_subsys->su_mutex;\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = f->item.ci_parent->ci_parent->ci_parent->ci_parent;	\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -1949,7 +1824,6 @@ static ssize_t uvcg_frame_##cname##_show(struct config_item *item, char *page)\
 	result = sprintf(page, "%u\n", f->frame.cname);			\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -1960,7 +1834,6 @@ static ssize_t  uvcg_frame_##cname##_store(struct config_item *item,	\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
 	struct uvcg_format *fmt;					\
-	struct mutex *su_mutex = &f->item.ci_group->cg_subsys->su_mutex;\
 	typeof(f->frame.cname) num;					\
 	int ret;							\
 									\
@@ -1968,8 +1841,6 @@ static ssize_t  uvcg_frame_##cname##_store(struct config_item *item,	\
 	if (ret)							\
 		return ret;						\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = f->item.ci_parent->ci_parent->ci_parent->ci_parent;	\
 	opts = to_f_uvc_opts(opts_item);				\
 	fmt = to_uvcg_format(f->item.ci_parent);			\
@@ -1984,7 +1855,6 @@ static ssize_t  uvcg_frame_##cname##_store(struct config_item *item,	\
 	ret = len;							\
 end:									\
 	mutex_unlock(&opts->lock);					\
-	mutex_unlock(su_mutex);						\
 	return ret;							\
 }									\
 									\
@@ -1998,28 +1868,25 @@ static ssize_t uvcg_frame_b_frame_index_show(struct config_item *item,
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
 	struct config_item *fmt_item;
-	struct mutex *su_mutex = &f->item.ci_group->cg_subsys->su_mutex;
 	int result;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	fmt_item = f->item.ci_parent;
 	fmt = to_uvcg_format(fmt_item);
 
+	opts_item = fmt_item->ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
+
 	if (!fmt->linked) {
 		result = -EBUSY;
 		goto out;
 	}
 
-	opts_item = fmt_item->ci_parent->ci_parent->ci_parent;
-	opts = to_f_uvc_opts(opts_item);
-
-	mutex_lock(&opts->lock);
 	result = sprintf(page, "%u\n", f->frame.b_frame_index);
-	mutex_unlock(&opts->lock);
 
 out:
-	mutex_unlock(su_mutex);
+	mutex_unlock(&opts->lock);
 	return result;
 }
 
@@ -2042,12 +1909,9 @@ static ssize_t uvcg_frame_dw_frame_interval_show(struct config_item *item,
 	struct uvcg_frame *frm = to_uvcg_frame(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &frm->item.ci_group->cg_subsys->su_mutex;
 	int result, i;
 	char *pg = page;
 
-	mutex_lock(su_mutex);	/* for navigating configfs hierarchy */
-
 	opts_item = frm->item.ci_parent->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -2057,8 +1921,6 @@ static ssize_t uvcg_frame_dw_frame_interval_show(struct config_item *item,
 		pg = page + result;
 	}
 	mutex_unlock(&opts->lock);
-
-	mutex_unlock(su_mutex);
 	return result;
 }
 
@@ -2069,12 +1931,9 @@ static ssize_t uvcg_frame_dw_frame_interval_store(struct config_item *item,
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
 	struct uvcg_format *fmt;
-	struct mutex *su_mutex = &ch->item.ci_group->cg_subsys->su_mutex;
 	int ret = 0, n = 0;
 	u32 *frm_intrv, *tmp;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = ch->item.ci_parent->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 	fmt = to_uvcg_format(ch->item.ci_parent);
@@ -2110,7 +1969,6 @@ static ssize_t uvcg_frame_dw_frame_interval_store(struct config_item *item,
 
 end:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -2272,9 +2130,6 @@ static ssize_t uvcg_uncompressed_guid_format_show(struct config_item *item,
 	struct uvcg_uncompressed *ch = to_uvcg_uncompressed(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &ch->fmt.group.cg_subsys->su_mutex;
-
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
 
 	opts_item = ch->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
@@ -2283,8 +2138,6 @@ static ssize_t uvcg_uncompressed_guid_format_show(struct config_item *item,
 	memcpy(page, ch->desc.guidFormat, sizeof(ch->desc.guidFormat));
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return sizeof(ch->desc.guidFormat);
 }
 
@@ -2294,13 +2147,10 @@ static ssize_t uvcg_uncompressed_guid_format_store(struct config_item *item,
 	struct uvcg_uncompressed *ch = to_uvcg_uncompressed(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &ch->fmt.group.cg_subsys->su_mutex;
 	const struct uvc_format_desc *format;
 	u8 tmpguidFormat[sizeof(ch->desc.guidFormat)];
 	int ret;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = ch->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -2325,7 +2175,6 @@ static ssize_t uvcg_uncompressed_guid_format_store(struct config_item *item,
 
 end:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -2338,11 +2187,8 @@ static ssize_t uvcg_uncompressed_##cname##_show(			\
 	struct uvcg_uncompressed *u = to_uvcg_uncompressed(item);	\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2350,7 +2196,6 @@ static ssize_t uvcg_uncompressed_##cname##_show(			\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -2363,19 +2208,14 @@ static ssize_t uvcg_uncompressed_##cname##_show(			\
 	struct uvcg_uncompressed *u = to_uvcg_uncompressed(item);	\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
 	mutex_lock(&opts->lock);					\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
 	mutex_unlock(&opts->lock);					\
-									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -2386,12 +2226,9 @@ uvcg_uncompressed_##cname##_store(struct config_item *item,		\
 	struct uvcg_uncompressed *u = to_uvcg_uncompressed(item);	\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int ret;							\
 	u8 num;								\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2415,7 +2252,6 @@ uvcg_uncompressed_##cname##_store(struct config_item *item,		\
 	ret = len;							\
 end:									\
 	mutex_unlock(&opts->lock);					\
-	mutex_unlock(su_mutex);						\
 	return ret;							\
 }									\
 									\
@@ -2477,6 +2313,8 @@ static struct config_group *uvcg_uncompressed_make(struct config_group *group,
 	struct uvcg_color_matching *color_match;
 	struct config_item *streaming;
 	struct uvcg_uncompressed *h;
+	struct f_uvc_opts *opts;
+	struct config_item *opts_item;
 
 	streaming = group->cg_item.ci_parent;
 	color_match = uvcg_format_get_default_color_match(streaming);
@@ -2498,12 +2336,17 @@ static struct config_group *uvcg_uncompressed_make(struct config_group *group,
 	h->desc.bmInterlaceFlags	= 0;
 	h->desc.bCopyProtect		= 0;
 
+	opts_item = streaming->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
 	INIT_LIST_HEAD(&h->fmt.frames);
 	h->fmt.type = UVCG_UNCOMPRESSED;
 	h->fmt.color_matching = color_match;
 	color_match->refcnt++;
 	config_group_init_type_name(&h->fmt.group, name,
 				    &uvcg_uncompressed_type);
+	mutex_unlock(&opts->lock);
 
 	return &h->fmt.group;
 }
@@ -2536,19 +2379,14 @@ static ssize_t uvcg_mjpeg_##cname##_show(struct config_item *item, char *page)\
 	struct uvcg_mjpeg *u = to_uvcg_mjpeg(item);			\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
 	mutex_lock(&opts->lock);					\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
 	mutex_unlock(&opts->lock);					\
-									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -2560,11 +2398,8 @@ static ssize_t uvcg_mjpeg_##cname##_show(struct config_item *item, char *page)\
 	struct uvcg_mjpeg *u = to_uvcg_mjpeg(item);			\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2572,7 +2407,6 @@ static ssize_t uvcg_mjpeg_##cname##_show(struct config_item *item, char *page)\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -2583,12 +2417,9 @@ uvcg_mjpeg_##cname##_store(struct config_item *item,			\
 	struct uvcg_mjpeg *u = to_uvcg_mjpeg(item);			\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int ret;							\
 	u8 num;								\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2612,7 +2443,6 @@ uvcg_mjpeg_##cname##_store(struct config_item *item,			\
 	ret = len;							\
 end:									\
 	mutex_unlock(&opts->lock);					\
-	mutex_unlock(su_mutex);						\
 	return ret;							\
 }									\
 									\
@@ -2669,6 +2499,8 @@ static struct config_group *uvcg_mjpeg_make(struct config_group *group,
 	struct uvcg_color_matching *color_match;
 	struct config_item *streaming;
 	struct uvcg_mjpeg *h;
+	struct f_uvc_opts *opts;
+	struct config_item *opts_item;
 
 	streaming = group->cg_item.ci_parent;
 	color_match = uvcg_format_get_default_color_match(streaming);
@@ -2688,12 +2520,17 @@ static struct config_group *uvcg_mjpeg_make(struct config_group *group,
 	h->desc.bmInterlaceFlags	= 0;
 	h->desc.bCopyProtect		= 0;
 
+	opts_item = streaming->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
 	INIT_LIST_HEAD(&h->fmt.frames);
 	h->fmt.type = UVCG_MJPEG;
 	h->fmt.color_matching = color_match;
 	color_match->refcnt++;
 	config_group_init_type_name(&h->fmt.group, name,
 				    &uvcg_mjpeg_type);
+	mutex_unlock(&opts->lock);
 
 	return &h->fmt.group;
 }
@@ -2727,11 +2564,8 @@ static ssize_t uvcg_framebased_##cname##_show(struct config_item *item,	\
 	struct uvcg_framebased *u = to_uvcg_framebased(item);		\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2739,7 +2573,6 @@ static ssize_t uvcg_framebased_##cname##_show(struct config_item *item,	\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -2752,11 +2585,8 @@ static ssize_t uvcg_framebased_##cname##_show(struct config_item *item,	\
 	struct uvcg_framebased *u = to_uvcg_framebased(item);		\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2764,7 +2594,6 @@ static ssize_t uvcg_framebased_##cname##_show(struct config_item *item,	\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -2775,12 +2604,9 @@ uvcg_framebased_##cname##_store(struct config_item *item,		\
 	struct uvcg_framebased *u = to_uvcg_framebased(item);		\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int ret;							\
 	u8 num;								\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2802,7 +2628,6 @@ uvcg_framebased_##cname##_store(struct config_item *item,		\
 	ret = len;							\
 end:									\
 	mutex_unlock(&opts->lock);					\
-	mutex_unlock(su_mutex);						\
 	return ret;							\
 }									\
 									\
@@ -2824,9 +2649,6 @@ static ssize_t uvcg_framebased_guid_format_show(struct config_item *item,
 	struct uvcg_framebased *ch = to_uvcg_framebased(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &ch->fmt.group.cg_subsys->su_mutex;
-
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
 
 	opts_item = ch->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
@@ -2835,8 +2657,6 @@ static ssize_t uvcg_framebased_guid_format_show(struct config_item *item,
 	memcpy(page, ch->desc.guidFormat, sizeof(ch->desc.guidFormat));
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return sizeof(ch->desc.guidFormat);
 }
 
@@ -2846,11 +2666,8 @@ static ssize_t uvcg_framebased_guid_format_store(struct config_item *item,
 	struct uvcg_framebased *ch = to_uvcg_framebased(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &ch->fmt.group.cg_subsys->su_mutex;
 	int ret;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = ch->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -2866,7 +2683,6 @@ static ssize_t uvcg_framebased_guid_format_store(struct config_item *item,
 
 end:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -2920,6 +2736,8 @@ static struct config_group *uvcg_framebased_make(struct config_group *group,
 	struct uvcg_color_matching *color_match;
 	struct config_item *streaming;
 	struct uvcg_framebased *h;
+	struct f_uvc_opts *opts;
+	struct config_item *opts_item;
 
 	streaming = group->cg_item.ci_parent;
 	color_match = uvcg_format_get_default_color_match(streaming);
@@ -2945,10 +2763,15 @@ static struct config_group *uvcg_framebased_make(struct config_group *group,
 	INIT_LIST_HEAD(&h->fmt.frames);
 	h->fmt.type = UVCG_FRAMEBASED;
 
+	opts_item = streaming->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
 	h->fmt.color_matching = color_match;
 	color_match->refcnt++;
 	config_group_init_type_name(&h->fmt.group, name,
 				    &uvcg_framebased_type);
+	mutex_unlock(&opts->lock);
 
 	return &h->fmt.group;
 }
@@ -2979,11 +2802,8 @@ static ssize_t uvcg_color_matching_##cname##_show(			\
 		to_uvcg_color_matching(group);				\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;	\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2992,7 +2812,6 @@ static ssize_t uvcg_color_matching_##cname##_show(			\
 			 le##bits##_to_cpu(color_match->desc.aname));	\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -3000,7 +2819,6 @@ static ssize_t uvcg_color_matching_##cname##_store(			\
 	struct config_item *item, const char *page, size_t len)		\
 {									\
 	struct config_group *group = to_config_group(item);		\
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
 	struct uvcg_color_matching *color_match =			\
 		to_uvcg_color_matching(group);				\
 	struct f_uvc_opts *opts;					\
@@ -3012,25 +2830,21 @@ static ssize_t uvcg_color_matching_##cname##_store(			\
 	if (ret)							\
 		return ret;						\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
-	if (color_match->refcnt) {					\
-		ret = -EBUSY;						\
-		goto unlock_su;						\
-	}								\
-									\
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;	\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
 	mutex_lock(&opts->lock);					\
 									\
+	if (color_match->refcnt) {					\
+		ret = -EBUSY;						\
+		goto unlock_opts_lock;					\
+	}								\
+									\
 	color_match->desc.aname = num;					\
 	ret = len;							\
 									\
+unlock_opts_lock:							\
 	mutex_unlock(&opts->lock);					\
-unlock_su:								\
-	mutex_unlock(su_mutex);						\
-									\
 	return ret;							\
 }									\
 UVC_ATTR(uvcg_color_matching_, cname, aname)
@@ -3583,14 +3397,10 @@ static const struct uvcg_config_group_type uvcg_streaming_class_grp_type = {
 static ssize_t uvcg_default_streaming_b_interface_number_show(
 	struct config_item *item, char *page)
 {
-	struct config_group *group = to_config_group(item);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	int result = 0;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = item->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -3598,8 +3408,6 @@ static ssize_t uvcg_default_streaming_b_interface_number_show(
 	result += sprintf(page, "%u\n", opts->streaming_interface);
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return result;
 }
 
@@ -3648,7 +3456,7 @@ static int uvc_func_allow_link(struct config_item *src, struct config_item *tgt)
 	struct f_uvc_opts *opts;
 	int ret = 0;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
+	mutex_lock(su_mutex);
 
 	/* Validate that the target is an entry in strings/<langid> */
 	strings = config_group_find_item(to_config_group(src->ci_parent->ci_parent),
@@ -3676,6 +3484,7 @@ static int uvc_func_allow_link(struct config_item *src, struct config_item *tgt)
 
 put_strings:
 	config_item_put(strings);
+
 	mutex_unlock(su_mutex);
 
 	return ret;
-- 
2.55.0

