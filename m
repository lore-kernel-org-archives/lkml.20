Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AD13822B1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130872; cv=none; b=GGfdm4YmnKKa5aM81+qJXj7i7+x8dKoawF8WwYMr8HC3m2QEtyQZGSu3a7cZkTHSdm2S8A63/5F4G1d5flMZ0QyeTgZ7xGUu9EaI6odlxgAy9eJyIX2nSnStM/lvss3garRScWzlkz9FQUSYUQJZz0S4el2hHzQFfBw1PwQGbLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130872; c=relaxed/simple;
	bh=RuC+pKhSD2K/27dctlbOdpdt9wqEB4Yvn2GPASfZbfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YLStuzEQK5adLHfLLi78Bh2BKvjHQ/BER5tzfyHnQhx1fWKkdvrtw2FwOvzsEob8rtM6K5v6CKWk54P6AOrMXdLg0ymA4GPJXBvBrxu2hQx4Zs35s0nryML7G1GC4pmoJf4P/D45LUZI+JgvV7DYsJELbgJ21sXonDw8s+IbNKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rvLBIntM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rvLBIntM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so1919145e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790130868; x=1790735668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QW+BLYCi+D5tYXln7s8opXbqlHXi6CiL8jzKDo+UXSI=;
        b=rvLBIntMAekS9O1AbzM9PEup92sVggrk5Yl67nX7yzHdl2NGlK1vDmO5aqk8W9PUdd
         k5t8p6KQxEx4bgiaCpGoruZhDEieLvFXt8Ji2xN326rXzRAz1lHFiS759wP0Fd7Id87V
         oQbqYvEvpUFe8//UC+xjbUpCWvPMOJhkzSDMUq3o7x/s4Q3cvUyKffseI7taOLIfaMVO
         oKqdTjIjqDffNFMRX212fZA1ffwXHeV8AuNFXJ7OtrAN5oT/s/c70mskulf+EfmR4bUE
         pPEYsdIrjmD1h5IyI3QNN/FRkcdC3EhBLuzrK3wTDjTieYVF0g74d3yJKbbxP1kPEuci
         fjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790130868; x=1790735668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QW+BLYCi+D5tYXln7s8opXbqlHXi6CiL8jzKDo+UXSI=;
        b=X8E5NLWOrmA3/nVHc6CvP09nOkdljvUhcxU08roAosImNmpy1YPsQX9MMdgQMHC4AC
         Epvo3uYJiyfoX/dGPYgEkneJfKQXJuHS0wbgSEUfMG/EMu1IR7pm18F+EjIYuGzPmHAF
         fR5mvqCQVsaTI40MZB3cwQ4L9Sc3sn7x8E1PQLFIKhopGe98YlmicgUsfYMEgZTmyLaK
         CS4xQpGie/6MDnA+oPah+f8jZPYvK+3buTuaNVtsyBmQ2E2/b/HkDWMc7wLItiJErlrM
         hqSag7Mo4fEVx2A+Y/jbMZ0dL2RZPVFqH4CLl/gmCPAhej85/XKHjv3ccazY0JLvBOFj
         LUNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjPR+kjynhoEfVPG4NKVm+Du9bFiSRkVAkYbuZKTrZbyaqjP7Dgj1Yu/czrJGdNoEegezG8fAdzrAQM+M=@vger.kernel.org
X-Gm-Message-State: AFuF++lsqLMKiwzThp88TReGzWEOCTLz8doMwWZbjYS1KKCpxt3csPqR
	ByI8Vzy/l6vcLppTbjn2aNNesYLgR7J4C73Mq01LtxEhtoEB43diJhur
X-Gm-Gg: AYBFou1638I4bP+Zf5bAxgMaGY3ZjERNbKkn+W8s1q7IcNsds+liOcork+ZaH8VV/nD
	18X5FKgtEgbMbW/TZP/6PoYjJ9yVbISIbKQc729W7IQxhgELgPWzDb9lJxuwJDSUm1mKDzi7yqG
	AbJ6tXZlyQnRkkwyUbW6x0uf9r6o2piSn9SfAlnY5ZRclcS4RalXPDNxl4mB7rBApQq8cQnSEFC
	UaudmK2tmy8mJz9ady1jb2lUAywI0IJbN3vxnGXayTc14NnS5PCuxaAjJCdqiSxU5g7LoorrkCX
	JYvs4mwT7Fv6ALBvc6xWU2mXAj+DeLohtXNdCpjwh/MYQYWaIRLJF5rbDQMTd345Q9V3d3OcCBI
	5C27ta8n5egTwX7ac7KdVwQgmraUayNhBuKY6OiazFEjrp8UBYGjKYZd5sKBmrIxHM9NNQ+VYpz
	g2VADaatWfOp8A5M3KYYm5g3mpz98NFWEeFEAI1z1uxyokAsT0LndRilmeOwN/K5td
X-Received: by 2002:a05:600c:3b84:b0:49c:ff8d:b548 with SMTP id 5b1f17b1804b1-49fdecd5957mr14036365e9.11.1790130868455;
        Tue, 22 Sep 2026 19:34:28 -0700 (PDT)
Received: from linux ([205.237.104.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm2879532f8f.19.2026.09.22.19.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:34:28 -0700 (PDT)
From: Eduard Zateev <hackerowskiy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eduard Zateev <hackerowskiy@gmail.com>
Subject: [PATCH] staging: greybus: avoid snprintf truncation in audio topology
Date: Wed, 23 Sep 2026 04:34:05 +0200
Message-ID: <20260923023405.41700-1-hackerowskiy@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building with W=1 reports format truncation warnings when prefixing
the Greybus device id to widget and control names.

The destination buffers are NAME_SIZE bytes, while the copied topology
names may already take most of that space. Split the operation into
writing the prefix first and then copying the remaining name into the
space left in the destination buffer.

This avoids the -Wformat-truncation warnings while preserving bounded
string handling.

Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
---
 drivers/staging/greybus/audio_topology.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 76146f91cddc..72a71fd38312 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -1019,6 +1019,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 	struct gbaudio_control *control, *_control;
 	size_t size;
 	char temp_name[NAME_SIZE];
+	int name_len;
 
 	ret = gbaudio_validate_kcontrol_count(w);
 	if (ret) {
@@ -1087,7 +1088,8 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 
 	/* Prefix dev_id to widget control_name */
 	strscpy(temp_name, w->name, sizeof(temp_name));
-	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
+	name_len = scnprintf(w->name, sizeof(w->name), "GB %d ", module->dev_id);
+	strscpy(w->name + name_len, temp_name, sizeof(w->name) - name_len);
 
 	switch (w->type) {
 	case snd_soc_dapm_spk:
@@ -1144,6 +1146,7 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 	struct gbaudio_control *control, *_control;
 	size_t size;
 	char temp_name[NAME_SIZE];
+	int name_len;
 
 	size = sizeof(struct snd_kcontrol_new) * module->num_controls;
 	dapm_kctls = devm_kzalloc(module->dev, size, GFP_KERNEL);
@@ -1169,8 +1172,10 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 		control->id = curr->id;
 		/* Prefix dev_id to widget_name */
 		strscpy(temp_name, curr->name, sizeof(temp_name));
-		snprintf(curr->name, sizeof(curr->name), "GB %d %s", module->dev_id,
-			 temp_name);
+		name_len = scnprintf(curr->name, sizeof(curr->name), "GB %d ",
+				     module->dev_id);
+		strscpy(curr->name + name_len, temp_name,
+			sizeof(curr->name) - name_len);
 		control->name = curr->name;
 		if (curr->info.type == GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED) {
 			struct gb_audio_enumerated *gbenum =
-- 
2.55.0

