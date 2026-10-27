Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080297;
	b=LEFGbH+HRf3Nhm4P2Jhh/FaQnm0kANL3/YFHg7uzyxyc/pkQK+Kmd+QV20Ynna+/98l1
	 +3XwwbFFrkY3bzNoO9gp8o1gCxNpFGFPH/uVlbP8BLWmuJ77qBZjNLevpjtrRuR+gJdbF
	 EtCf6ia21OM76gISjtcATOnDkwIMCfiTlO9HVXe58ru2aZzy8P3CGiFS0JeA+yZdlJ0xw
	 6wkMKQbNhKCf+F537lx0MwWlYpkl0wekAyMVbaucoBEHY39W3n6n71zEPlDJl8AXa0K6K
	 VWCiAsH0+MiZ9TZt5R+pCVQa04GGq5MvBfyDvx6teDSitAGMF0nEgJyp8DjXm0pl1Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sS6nMMIuDnR4tNo375vONtLVL0oaIgYfWQsXPhrKCLg=;
	b=YI+XUJWfwp3/zPgv5H5C+5JpeQGUkzh3Wy0IVZuH53PhVzS2cS61Eg+gtiFj3QdFYET0
	 1kXLQJRkVuc1Z4+cRs4hfTfWoh4hVRxVdvGn4FlqyGx/uBIsOjjVkZz1Tx+hQBmgSG3ra
	 5u1vNDwsTcSroJ/db3c8IsV0hfeXDc+CqJbz8eXeJGanJLbRN8K4WDuT4kE2sglevcuKB
	 darRhuAL9Y83gUzQQggGGdrQJtbjT6IAtZ19aLn7K9SRyTPO5La58FLFRYC6HtWqkF0vY
	 Vr3xu/De523khlVmO+jE2YHARKKTlhxm+p38OVVkACHUu0K4UP+EeE4gT23iv/gah5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WDWp6dEv;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8E4606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB8E4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WDWp6dEv
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a01cac8733so2824034b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793080291; x=1793685091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sS6nMMIuDnR4tNo375vONtLVL0oaIgYfWQsXPhrKCLg=;
        b=WDWp6dEv+9hmM+OJIa13/6VtgOGBZ8+a4sInfJDUojimVDQYboJ8A+wf/9hj55+Q8W
         uy5E3xlpPAriDc77Ya1jVgavzOzfFhdmhPP5A98h66i2iIbuK2eByt5DC3JUdQGxtF4g
         wrQobIEKmumRLWmfl0oK+To0IWg4C33bsHChnZri3RAxy185cWw4Pz2ASf9wo5GjvrBQ
         vMfcd4gIGERMLJSUTGhKx84BLXmNz+Dqbd5scN9u+lndXqoqakITOemu+oNdQoYrylTk
         dbYDXWIlW7PR0KYivt8IVtkg9eSrowfAqlc0B6/VcarylHWkq/y6CrknZXa+WZ0C44Ku
         DGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080291; x=1793685091;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sS6nMMIuDnR4tNo375vONtLVL0oaIgYfWQsXPhrKCLg=;
        b=GUR9ikAfL70VQRx6XxZfzg5OCcBA1x8W5gNMnpt/UMDgz7CV0RzqoBwxZnoWOVGWN9
         n47GyD3Yo89H2PfPr5UTrDFtnOdTXEc0wG7BDRggnxDCksmSBeFhMK5QjYQwGtQHQZiV
         v16YYBX3auNeyb6PUf1SfjtcP46ORmKJf9k3HNmp7q/7c/dM7wecY9uE2adRH+EINI6H
         hWWd1ROkPOSroBzharfef61uDJ6xzehtuuuim/w5O6PgpNK51egbHstxHBnip8QwghDW
         OaUi/tidyA90EDo1nhW5V2s4VW5p3Q5pnYWDPqadweFb5CkkkaUDONlthFHWkN0Lax6D
         Azeg==
X-Forwarded-Encrypted: i=1; AKwUvByLMGkHWaMZEpdX3BYYmk3+UIp9TuDstxSh/kWM3mIWglQBIZRmr8c0yHklKGFQI6Ipmx2fHGUReP2k2fs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTYuQCeI0kyuD41wIPi9G5QiYJ3bmrDgNr/MN8kv5tG/GNN7WM
	E0rZ0pxhQ+T8iLl1NHEEKEGj4M0mNuDGQey9qjtyes3qqLlWVPCpnTKhecu9F1Ru
X-Gm-Gg: AYBFou1DEwcVkHTfrArgFb4yqSdtPlRbkKM1R1OpDUXEFvGGLPco9iSwaywhlAFmI+c
	tQxqz5aR9zOrUbxZ6N0To/3wuWz+5eoVb7kMaYQAWhAXucck69sUEMC4p+0vvL7BD5Mv3kCJINo
	JCBA+9QUxycPf95wdLHFq+MuML3eJoXzN8acGQQAzU9BdPqS2gdw2mTWxqr0Kcx9Q+oHPUmnGNd
	q195oEIF0nxzwqMIzxC7sSFdu4IvrNL+eVnhPmmTAr0fYzxRf5qKH5nD4GaWXtNmvZsPfy40Lgh
	GOxiR5xFeeo5+qDdkjCk8e3Z/BuZVMrTreY5q5XBEx/csV5SmH4hvslfj9P5HZ81zoMIJveUOak
	F3k/HQGQWL5baCv/dqv38reHYt8ZEsPES/hAuNGrwVzPV6KZxLS4uWFUu1oYcxf+KgVUP6set4L
	ie6CZT3aaCBWBQGQDoQJCVWDsTEl7BZc56QYRvlROxgAba9jd9U9Noe2ggGWuT7GA0YZdX76d0L
	/RAYSVZICfPd2wHxkzRpBybR4l11c/c78VzwIHPSVpNhQ==
X-Received: by 2002:a05:6300:398:b0:3e2:86b6:9c05 with SMTP id adf61e73a8af0-3e7bfac3587mr6067370637.37.1793080291076;
        Mon, 26 Oct 2026 22:51:31 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc682d8sm2280332a12.18.2026.10.26.22.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:51:30 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:51:27 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: Re: [PATCH v4 28/31] ntfs: report EA metadata and restoration errors
Message-ID: <auA734yJUBRQPQD_@hyunchul-PC02>
References: <20261020084421.2196486-1-liubaolin12138@163.com>
 <20261020084421.2196486-29-liubaolin12138@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261020084421.2196486-29-liubaolin12138@163.com>

> @@ -605,6 +621,8 @@ ssize_t ntfs_listxattr(struct dentry *dentry, char *buffer, size_t size)
>  	} while (next > 0 && offset < ea_info_qsize);
>  
>  out:
> +	if (err == -EUCLEAN)
> +		ntfs_report_file_metadata_error(inode, err);

this function appears to reache here with -EIO or -ENOENT.

-- 
Thanks,
Hyunchul
