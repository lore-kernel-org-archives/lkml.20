Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE9A470116
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183307; cv=none; b=ZU49dVE7VFneX+erG2ZlWJshPqbyOcfNdFrAtc0LSQSBg0Jl+yIWWLK8exlElVZhKBz9leedwzgycHGztAYHDKX1pn5YlDhZeM+4AKTHmuAtYhWcxEhKYhM38MTiNFWAoas9JRNtjKp2azLeP2LAVneMvXWj6ootZk7LblH1/gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183307; c=relaxed/simple;
	bh=LxnN9E91gB6bKTXs5ezbVHYTIFaagN/u/1Xh+pEA2ew=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1WvrvsUC0o9QfJKoAKQCEYMeQKWVgOVjT/QZlLKUAvv6S0MRbaCNZm7Jh+ZmCvC8tSplnh0E1T6Evte2Lg8oklUeyQkZ2B1egWXIL+w3WYCTxVAOQmR5N5KMPVxGOU8RFFZkKorGDCsq81jCHfbFqDhan7JfFJ+n/1y6C+Crlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ByV3rUcj; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ByV3rUcj"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso3250387b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788183305; x=1788788105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zG2Wsg/BzhPMjOE3JgOxdh5m31QBgm88y6qID8vV1kI=;
        b=ByV3rUcj8sn1VqFMVgbbItA92+Db1VdEM/+324ASqW9V+9L98KEXnG/bFEzSU06GIj
         1C6dQrrrZlZsawhDhOYjdgRHQNrrubrGE/lcXAp62ZIqdy6to12XSOxEao4GQrRhgUve
         TcJD3iBNtYt6xE+lqY50N9M0WJBZ3E17gBXBhKYN1b2pXGsxwEcXmOryvg2gD2aUIcSJ
         NOQY3fFavi28/qKWu0qDXkpyGUQYWgX3ceHM9TtzpzWDsDMA1sNFHiQNDxsOh4nEdLRT
         xce1qgqvwhhCWR2NzAqfpSfcxt9bQ1iU73L6EZFJ7p6/FhtRaoWHnuHzUczmFFFkgDed
         4cMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788183305; x=1788788105;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zG2Wsg/BzhPMjOE3JgOxdh5m31QBgm88y6qID8vV1kI=;
        b=o40PMypdwvGOgV0KYLinvDQXlvkLkgH7LbStmqZcFSKxd584pE8c0e9bxOyZGksTQG
         zcOCG3GWmzk3lpdxG7fcBntfiCvFXAN1O40X7sk1zOeP9zVlBy04WjtpsY15tZ3n/Fuf
         aGwf+WodVmhbx9hkpHBXDsMnBRn3bkjiy0dPYN4NkqjH4vYKJtM+Si6WQMomlkSQ9FTx
         pvvWdX37TXRB8Ch1EP9439YHxOKnmPQemBUc0P85oDn7jSK/201LQszmFDOKWvZf7Vfz
         CWxecu31rZHZDgxsTKJ61x2CUNtoMcj0ahy8Kx1KKxsmyWmM3pQCZgNMRyb3n6KH/48w
         IqIg==
X-Forwarded-Encrypted: i=1; AHgh+RpUgjDm81wbuuJCMcK8N0cREdtKxzKvZPsobLw/bRgiPaXThecFnwCPxcJV/ZHvnEk8kCAqIJRxV6jZ0gg=@vger.kernel.org
X-Gm-Message-State: AFuF++mp3amIEhC8TY+X3y88bP8Ul2Toiy+M95SHslzQKWcE/81CVI6S
	nTP1aP7Dcaxm6s6+G3Y7cbWJmfS98iIK2rdy63+V/Lcwqg/nb87kVUYU1NCswOZvYGZRPg==
X-Gm-Gg: AR+sD12ImZWwXMEf7ITtGGmphXhQ9wkw3mW4bOAX3f2fw1gSpwdnclv6DVB2T75Z6/B
	yroKzpGXVoXaZM0SXnsA358gSX8Yw5UiCGUxama9P+ZtibyqNXfThBHfm20tkQ7BKHMtVzj3GYC
	WvJALTO9Hbk6HiU4Ym88Z7d0pcx4vKp5GwisMBp12itdBmb60hm3j51nkQgdq5kBKUxPhKuSij+
	8TddpKfZvmHNz/A17Hl/ThmIE3ToaCgPfX1r7BReLgkxgk5PuIzJpoeIRAra0XxJKTwx2arETW2
	ZuaWyj874cFnJMX//XjbZNduAGAhx1yq59B16KtJ62xdz26BTuuokB+LiH4o6Zd1RQRSGBTWoY0
	XFS57oaMY21mlvbiEhfsQl6DIHKf2XVEqJSid5b378C7WM5Vb2Z40dWVmcgerHWDLz7MYOODS2+
	poEYqbEEYo4iZTJ6XEoYOeXuJiiTdjPrOPXD08Uu7sXjSst0OYrUFh9w==
X-Received: by 2002:a05:6a00:1390:b0:857:72f8:dca3 with SMTP id d2e1a72fcca58-859972b7fddmr6498579b3a.9.1788183305220;
        Mon, 31 Aug 2026 06:35:05 -0700 (PDT)
Received: from localhost ([45.112.44.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569f49f50bsm3843564b3a.11.2026.08.31.06.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:35:04 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Mon, 31 Aug 2026 21:34:30 +0800
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: kexec@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <baoquan.he@linux.dev>, Dave Young <ruirui.yang@linux.dev>, 
	Pratyush Yadav <pratyush@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 8/9] crash_dump: Disallow
 configfs/crash_dm_crypt_key/reuse if crash hotplug supported
Message-ID: <apWAp7FamnxneZ3v@Rk>
References: <20260828084900.1496839-1-coiby.xu@gmail.com>
 <20260828084900.1496839-9-coiby.xu@gmail.com>
 <38e371e9-1f0a-4e9f-a5e1-0b9d696379da@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <38e371e9-1f0a-4e9f-a5e1-0b9d696379da@linux.ibm.com>

On Sun, Aug 30, 2026 at 01:28:59PM +0530, Sourabh Jain wrote:
>
>
>On 28/08/26 14:18, Coiby Xu wrote:
>>If crash hotplug is supported, dm-crypt keys saved to reserved memory
>>will be taken care of automatically. Thus it doesn't make sense to use
>>configfs/crash_dm_crypt_key/reuse. Not reserving
>>image->dm_crypt_keys_addr makes it implicitly to disallow using this
>>API. Currently x86_64 and ppc64le have implemented crash hotplug
>>feature.
>>
>>Also update the doc accordingly. Note two doc issues are fixed as well.
>>
>>Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
>>Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>>---
>>  Documentation/admin-guide/kdump/kdump.rst | 16 ++++++++++------
>>  kernel/crash_dump_dm_crypt.c              | 13 +++++++++----
>>  2 files changed, 19 insertions(+), 10 deletions(-)
>>
>>diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
>>index 7587caadbae1..0bf2eb100a05 100644
>>--- a/Documentation/admin-guide/kdump/kdump.rst
>>+++ b/Documentation/admin-guide/kdump/kdump.rst
>>@@ -577,9 +577,10 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
>>  1. Tell the first kernel what logon keys are needed to unlock the disk volumes,
>>      # Add key #1
>>-    mkdir /sys/kernel/config/crash_dm_crypt_keys/7d26b7b4-e342-4d2d-b660-7426b0996720
>>+    VOL1_UUID=7d26b7b4-e342-4d2d-b660-7426b0996720
>>+    mkdir /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID
>>      # Add key #1's description
>>-    echo cryptsetup:7d26b7b4-e342-4d2d-b660-7426b0996720 > /sys/kernel/config/crash_dm_crypt_keys/description
>>+    echo cryptsetup:$VOL1_UUID > /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID/description
>>      # how many keys do we have now?
>>      cat /sys/kernel/config/crash_dm_crypt_keys/count
>>@@ -591,15 +592,18 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
>>      cat /sys/kernel/config/crash_dm_crypt_keys/count
>>      2
>>-    # To support CPU/memory hot-plugging, reuse keys already saved to reserved
>>-    # memory
>>-    echo true > /sys/kernel/config/crash_dm_crypt_key/reuse
>>-
>>  2. Load the dump-capture kernel
>>  3. After the dump-capture kerne get booted, restore the keys to user keyring
>>     echo yes > /sys/kernel/crash_dm_crypt_keys/restore
>>+For CPU/memory hot-plugging, you can reuse keys already saved to reserved
>>+memory before reloading the kdump image,
>>+    echo true > /sys/kernel/config/crash_dm_crypt_keys/reuse
>>+
>>+Note if crash hotplug is supported, this API is totally unnecessary thus will
>>+be disabled automatically.
>>+
>>  Contact
>>  =======
>>diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
>>index b7629174e4db..3aaa0f9c3117 100644
>>--- a/kernel/crash_dump_dm_crypt.c
>>+++ b/kernel/crash_dump_dm_crypt.c
>>@@ -324,7 +324,7 @@ static ssize_t config_keys_reuse_store(struct config_item *item,
>>  	r = -EINVAL;
>>  	if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
>>-		pr_debug("dm-crypt keys haven't be saved to crash-reserved memory\n");
>>+		pr_debug("dm-crypt keys haven't be saved to crash-reserved memory or crash hotplug supported\n");
>
>Nit: the above line is more than 100 characters. There is no
>complaint from checkpatch, but I feel we should reduce it to
>below 100 characters.

Thanks for the reminder! Documentation/process/coding-style.rst
explicitly states,
     However, never break user-visible strings such as printk messages because
     that breaks the ability to grep for them.

In fact, scripts/checkpatch.pl will issue a SPLIT_STRING warning if we
break the user-visible strings. So I think this is accepted unless
kexec/kdump subsystem has a hard column limit.

>
>Also, I checked that we don't have pr_fmt defined for this file,
>but we do have pr_debug and other pr_* calls. See if defining
>pr_fmt helps reduce the character count in the above line.

If I'm not mistaken, pr_fmt only adds a prefix. So I don't think it will
help reduce the character count in this particular case.

>
>But the overall idea of handling crash hotplug support with
>crash dm-crypt looks good to me. So feel free to add:
>
>Reviewed-by: Sourabh Jain sourabhjain@linux.ibm.com

Thanks for reviewing and ack'ing the patch!

>
>Thanks,
>Sourabh Jain
>
>
>>  		goto unlock;
>>  	}
>>@@ -519,9 +519,9 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>>  void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image)
>>  {
>>  	/*
>>-	 * For CPU/memory hot-plugging, the kdump image will be reloaded. Prevent
>>-	 * keys_header from being cleaned up during unloading when
>>-	 * is_dm_key_reused=true
>>+	 * For CPU/memory hot-plugging without CONFIG_CRASH_HOTPLUG, the whole kdump
>>+	 * image will be reloaded. Prevent keys_header from being cleaned up during
>>+	 * unloading when is_dm_key_reused=true
>>  	 */
>>  	if (!is_dm_key_reused) {
>>  		kfree_sensitive(keys_header);
>>@@ -532,6 +532,11 @@ void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image)
>>  		mutex_unlock(&config_keys_subsys.su_mutex);
>>  		mutex_acquired = false;
>>  	}
>>+
>>+#ifdef CONFIG_CRASH_HOTPLUG
>>+	if (image->hotplug_support)
>>+		image->dm_crypt_keys_addr = 0;
>>+#endif
>>  }
>>  static int __init configfs_dmcrypt_keys_init(void)
>

-- 
Best regards,
Coiby
