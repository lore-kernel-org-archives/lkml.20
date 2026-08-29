Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE4E33F5A9
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788005829; cv=none; b=HlksUx1pZTsNQxv79azecUqbohfV5o4x6eGF//GDGm1YFV8hKDkXDXRv0+kuA40iwSFBKEbBI8Mh+lKghqo/+a0rq4LcN3mvRpg90CgjOLUbm7PgluF1PKwk3Lswt4qjC4I9BRLTH90tzzwY6w2TNHHVZhGHSGgU/AcV9sda5O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788005829; c=relaxed/simple;
	bh=FXdqBljQrrOkSCYhVMOBG8COgmSTsXA+73XDyaj2RTs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XnfNwxwkZXV9N5yxQ5hcSCrthzZI3dQDy0JV+mxkuQ/tBCbonRfjtI1qKkRqLBDOi+s4YkwkJ+gvKQAw2kLe5B1o7/lu75ghTqvsjEHMd0nAIR9fgaULstPwBGevvyFIsmNWfBs1V6G0gzidW4HPFQ4gdVjhdimSNmnikXeuhEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGjJbGTp; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGjJbGTp"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so2982117a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 05:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788005828; x=1788610628; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IxDEN5h3lEQH8b8SjBjggeIIHExzyIDlG18CyIBp748=;
        b=LGjJbGTprKrMrqbyjhKwC7AHKhPVWO0rDzS5tqOmpaUDsGv4NPi0QoEqA6taid0CFO
         yniM4XunjuOsYRa8OgLZEJ9o7zFOkvL+gjIlkm+NS+IEyItOLtBkxUat7G1OcorqDJt0
         ANe3CgAFJEOBo69bNM8MPoJdLUiWc+UH4Hov6itmkeaRHbH6uQBFlMjdhC6CJFAlNRKH
         75h/wGtrd9W2ZGhj2uyYoX5yaW8MNRJK85ENFlzs1fv8bw2Uqp1Qi7cD6GX0Uq5Uyj64
         GaWmcCPdt5CZlLmFszEkhH+GgIljn0NAEMZn4JU+TyHQKheGgacqX7jTLahA1aw9gpMi
         Hejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788005828; x=1788610628;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IxDEN5h3lEQH8b8SjBjggeIIHExzyIDlG18CyIBp748=;
        b=fYj1oMFFtQIo2ZOuv3B/dLb9V0Vh5c4IgVKlbhZEbuSnPRggfA+pBOnfHc2bDg+V95
         WSQyiGk9XGT5allu8sAZFbKIJdFw7dkZ6JOBhgmZzV/djm2l9HqRbR9RVankjJR+UsGc
         IQnbvE4bRDNiorpI2ENSek/mOx63Z5URegI/gU25SO6UICaKonHhRPyzBZG9/ehq/eg8
         LFm7CVVpC8+7edtdt1PdTdC4Se4vDAr09IPZFsVPIfA8bl+XVgpoSkWW21XvaHcFf5za
         t75M+ELq6Chp1VHFy9NVzkjg3iijDQTGR1Z/Jk9Hk4OR3Iiy4dbT77he320rmBfU9WBo
         ZMFw==
X-Forwarded-Encrypted: i=1; AKwUvBwMUGXbG+B7cy7vvDt2sTI2YYGbzaN1cRdQKEI41t6uAu+vA9mJ2uXWDnho46OOeDz2RDlIQFw/6ExEWPg=@vger.kernel.org
X-Gm-Message-State: AFuF++lE+muB/t6LRc8nqoF2wIljHxB35z2xPofARfvhehjUwLnZT7CC
	g9k0aJajxjoDh4sn6SLdY9JG4gjVfnFX7UduzdHJ7gMh3sCumSo+JQqVQG6sS/kz
X-Gm-Gg: AYBFou1TPIKGwXwWBpUrHPNei5/ktQ16pPIuWm19T5lAUQ4OHttSq7EQ1ht1dNgtSGE
	juvZHMtQ+h0JWz69d3x9cRAWIEvKwtqeTKqFqGiuO+7czCh5X5Hj3aML05E03gktjXGx21TEnk1
	l0LXOGMHeYX7KvdnZKYUUuMVpblsAHHep/tsNfFpkc0NdKgdg4DSpxmAdn8g4vmdu3sCFYoqFx/
	gKuFlNBFuR+1A2dFOg8ilT8m9WRzOe6h/mU5hEmhxRaI5t6nmqt7Iw9mf7m7rgHTeIU2bN+keSN
	qQ1Royoj4CNzI95v9xEmcZbPySOOpf2MKmJmfEPXAYotjF1e9bpFf6C+HveuRIFwDST0pnuv6Oj
	e48xNbJB53ABLUfxqmI1UWjn0I5KmA11yZzWG8Ea9LUN2MXXKqwnPff6zing8a4jbYWNkZzM/7r
	oCimpNn9zgRp3MLd8mT0wCgyUnAasw001iIKRvlfHQaY2FzR/DC1EIis9YaBGC1X8D
X-Received: by 2002:a17:90b:56c7:b0:398:9bd4:d18 with SMTP id 98e67ed59e1d1-3989bd41466mr9165110a91.23.1788005827437;
        Sat, 29 Aug 2026 05:17:07 -0700 (PDT)
Received: from localhost ([45.112.44.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398b18b4074sm2555834a91.12.2026.08.29.05.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 05:17:06 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Sat, 29 Aug 2026 20:17:00 +0800
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: kexec@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <baoquan.he@linux.dev>, Dave Young <ruirui.yang@linux.dev>, 
	Pratyush Yadav <pratyush@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/9] crash_dump: Disallow writing to dm-crypt configfs
 during kexec_file_load syscall
Message-ID: <apLKk_P9wHc9uSZQ@Rk>
References: <20260828084900.1496839-1-coiby.xu@gmail.com>
 <20260828084900.1496839-3-coiby.xu@gmail.com>
 <86f3b10d-6fc2-4dbc-a20b-5d2365601be2@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86f3b10d-6fc2-4dbc-a20b-5d2365601be2@linux.ibm.com>

On Sat, Aug 29, 2026 at 12:32:46PM +0530, Sourabh Jain wrote:
>
>
>On 28/08/26 14:18, Coiby Xu wrote:
>>If writing to the configfs group happens concurrently during
>>kexec_file_load syscall, it may lead to the following issues,
>>   - buffer overflow if dm-crypt keys are added after allocation
>>   - stale total_keys if dm-crypt keys are removed during iteration
>>   - keys_header will not be freed if config/crash_dm_crypt_key/reuse is
>>     set true
>>
>>So hold config_keys_subsys.su_mutex for the entire sequence during the
>>kexec_file_load syscall to ensure a consistent snapshot. To have serial
>>access to config/crash_dm_crypt_key/reuse, use the kexec lock as we also
>>need to access kexec_crash_image serially.
>>
>>Fixes: 479e58549b0f ("crash_dump: store dm crypt keys in kdump reserved memory")
>>Suggested-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>>---
>>  kernel/crash_dump_dm_crypt.c | 28 ++++++++++++++++++++++++----
>>  1 file changed, 24 insertions(+), 4 deletions(-)
>>
>>diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
>>index 4335b6cb1fc4..026c7de4ad85 100644
>>--- a/kernel/crash_dump_dm_crypt.c
>>+++ b/kernel/crash_dump_dm_crypt.c
>>@@ -7,6 +7,7 @@
>>  #include <linux/configfs.h>
>>  #include <linux/module.h>
>>  #include <linux/sysfs.h>
>>+#include "kexec_internal.h"
>>  #define KEY_NUM_MAX 128	/* maximum dm crypt keys */
>>  #define KEY_SIZE_MAX 256	/* maximum dm crypt key size */
>>@@ -296,14 +297,20 @@ static ssize_t config_keys_reuse_store(struct config_item *item,
>>  	bool val;
>>  	int r;
>>+	if (!kexec_trylock()) {
>>+		r = -EBUSY;
>>+		goto unlock;
>
>
>Are we unlocking a lock that we didn't acquire? How about returning 
>-EBUSY directly instead?

Ah, thanks for catching my mistake! And also thanks for prioritizing
reviewing my patch!

>
>
>>+	}
>>+
>>+	r = -EINVAL;
>>  	if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
>>  		kexec_dprintk(
>>  			"dm-crypt keys haven't be saved to crash-reserved memory\n");
>>-		return -EINVAL;
>>+		goto unlock;
>>  	}
>>  	if (kstrtobool(page, &val) || !val)
>>-		return -EINVAL;
>>+		goto unlock;
>>  	if (is_dm_key_reused) {
>>  		pr_info("Already got dm-crypt keys, please continue with kexec_file_load syscall\n");
>>@@ -311,12 +318,15 @@ static ssize_t config_keys_reuse_store(struct config_item *item,
>>  		r = get_keys_from_kdump_reserved_memory();
>>  		if (r) {
>>  			pr_warn("Failed to get dm-crypt keys from reserved memory\n");
>>-			return r;
>>+			goto unlock;
>>  		}
>>  		is_dm_key_reused = true;
>[...]
>>  	}
>>-	return count;
>>+	r = count;
>>+unlock:
>>+	kexec_unlock();
>>+	return r;
>>  }
>>  CONFIGFS_ATTR(config_keys_, reuse);
>>@@ -421,6 +431,8 @@ static int build_keys_header(void)
>>  	return 0;
>>  }
>>+static bool mutex_acquired;
>>+
>>  int crash_load_dm_crypt_keys(struct kimage *image)
>>  {
>>  	struct kexec_buf kbuf = {
>>@@ -432,6 +444,9 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>>  	};
>>  	int r = 0;
>>+	mutex_lock(&config_keys_subsys.su_mutex);
>>+	mutex_acquired = true;
>>+
>>  	if (key_count <= 0) {
>>  		kexec_dprintk("No dm-crypt keys\n");
>>  		return 0;
>>@@ -481,6 +496,11 @@ void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image)
>
>I explored the kexec_file_load syscall entry path and noticed
>that there is a path where the call to
>kimage_file_post_load_cleanup() can be skipped.
>
>For example, if kexec_file_load is called and everything goes well
>but kexec_post_load() fails, we skip
>kimage_file_post_load_cleanup(), and consequently
>kexec_file_post_load_cleanup_dm_crypt() as well.
>
>If that happens, the config_keys_subsys.su_mutex remains locked,
>which could cause problems with the next kexec load, right?

Thanks for exploring the kexec_file_load syscall entry path! I took a
further look at it. Even though kimage_file_post_load_cleanup can be
skipped, kimage_free will be called regardless which will in turn call
kimage_file_post_load_cleanup. 

     // kernel/kexec_core.c
     void kimage_free(struct kimage *image)
     {
     	/*
     	 * Free up any temporary buffers allocated. This might hit if
     	 * error occurred much later after buffer allocation.
     	 */
     	if (image->file_mode)
     		kimage_file_post_load_cleanup(image);
     }

But I realize by using kexec lock to ensure serial access to
is_dm_key_reused, we can actually release the mutex lock at the end of
crash_load_dm_crypt_keys function which can make the code simpler and
potentially more robust. Thanks for inspiring me to find a better
way!

>
>- Sourabh Jain
>
>>  		kfree_sensitive(keys_header);
>>  		keys_header = NULL;
>>  	}
>>+
>>+	if (mutex_acquired) {
>>+		mutex_unlock(&config_keys_subsys.su_mutex);
>>+		mutex_acquired = false;
>>+	}
>>  }
>>  static int __init configfs_dmcrypt_keys_init(void)
>

-- 
Best regards,
Coiby
