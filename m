Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447B63EFFC3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115793; cv=none; b=NJvJ6rvcv1gzitT1kf6FAs5odMxJ2IdUGwm2sUSbR0YXbln5sLKy+ojwCcJW2sOyi/pGgpuDRUahicwuu4ZOptr3EzuXFGKeFU0ogwMzEFkp8F12OjYpziEKpg40dZImIH02dWI+rw5sQI0CZQsLW/KnD2fjq6xl03i7jl/xePQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115793; c=relaxed/simple;
	bh=Vc3ke0ay4ZIsbqVFdQwr9M1YL4tDSowwtOtBmj13i1s=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPSM/bzWqNP4JNrVWdTda2N85/Mi258H7CqXsWjz0clixgZK4Tr4n7oALUhHz2bSTYSM58B3cYTB+i/0dvKlW15wQh/neh1fNo3boOaUxPG6X0dum37iD52V4zLd48Sa0SyifMh4QuNtjJu2BUDeikRB2VxcsLkPzPzXofzE2rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpOtc1OA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpOtc1OA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so2107855e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789115790; x=1789720590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AwcqdZ770QLscwW/qnLvteUOSMyAGgQxOPg3tQUK1ak=;
        b=lpOtc1OAcsLQkPG1rMP4Q3RuxQDnimMzKhIIkAar+W2vswIXViZBY0Xc2XIcPSiFwc
         bnJ0AWGysyNTIuxmwGEzJMSEYpnSTFc75TnWuW8vwys0OiJyEKlitv9Ci1vUsedLziB8
         +QSrpzoCHryZPIeRTwRoImcOyo7UZCMHk8iaZGpL2DlfrS2ePmOtFD+DhvDOwnul7q9P
         HozxMRNkK0dwHah7/keToneTuyhDRH0J7rt6k4pTTR1dmw6PtlA2Sta7fMAbdc6E0bLR
         UQU0Uhi6u6IkcV3RmU1XHUtDsOEt9bN9Sb1XZyNjluZjnalWXPmzus1uaWOrR+ees1pV
         44mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789115790; x=1789720590;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AwcqdZ770QLscwW/qnLvteUOSMyAGgQxOPg3tQUK1ak=;
        b=dFpeO/oiqznOx7NQUDm9tFX5+lMS2wynuWuBKDGqC6Ua8fW5xK/GdUyQO1nf9WZOo1
         BqqulaqxsTqojR1j4nBpEp+4CCIY99xZfcQkNmBWQlf4p9Jnu0iVzi3SLpTtvHS4pthr
         9LBFUc9wGq30NstyYwsbSAelYRbKeRGb7+px+RkiX11jaZ1VsxT5cyUERHt45ju+qwWi
         tZFuKSAlTl2qPZ/d1lL8qaIUZs6oaJGq09x49hloXvQcu6Z5qSCFNI5tT9IQ6MSACUpj
         DZUM1CA3SClaTfpGWSNxAUPmWsQnGpsKzXtD4mXzvxndtPFbxUTmFB0PIWcjqQJ4SVgc
         mn4w==
X-Forwarded-Encrypted: i=1; AKwUvBzqbDD92Hz3iib6eh7a83rV9961k7Ej5GoXACA8dXTjb1a1PKfxtX0u/aVbaXSTDr7psCG/s9AhR69zCU4=@vger.kernel.org
X-Gm-Message-State: AFuF++nbfjEAdpkU2jPx4UijnFcmVbMKzpH3+Cd1XmBCevJnYmi6QaMV
	wsyFXwlMozI+mc/RMk1pC8ZEnL07ZLmWsRy8Co04YcxE7k5/PFHBdkc8
X-Gm-Gg: AYBFou3AHXX4MLhdp+2GiDB8tm9Oh/QdlR2swC6PI4Uko6d/T8C5KajMf4LtAJ/Es+u
	Mrq4Fu7YUuGUdAL6bUDVb/EVOSQCdcNjolAGDB8M08j7NFeCFw1YdCtxHGAx4dIdawLmdH8btkT
	nQnY8mWAlsCYGPIYJ9leWr3/Svd9YuVau4ESD2ZyTt/f0mXrIjl9Hzm8vRNt57cryRgb+IU++ZR
	V3VpqDM/k7bMUNHaUQxjbVgr4ebS7docHtts9/npOxI80RshT40VYwKU4OzpXkAM16TsgDI4sDt
	/4Jytg6/nEsSTlByXanEu+x+T9dP3xT+VR1aIK6+D1X59cXZox2nr2MQ67RnX962oNIgVfMfyP3
	dinpSEcTvmH6eukCUfz/mJfNM6jWchew6xti5NHgWlJLw4uoIu3JCRVZa6nHe96Yl+SYZ/IWBEL
	wtiLqXO6VL7GE1+ZcIHmJ7Wk8R0RZnSAMsIkp3YRQajGegKErcTjmhUrEGafk29EkHo4TM
X-Received: by 2002:a05:600c:3115:b0:49d:1e79:35d6 with SMTP id 5b1f17b1804b1-49e61094b9bmr40223525e9.14.1789115790162;
        Fri, 11 Sep 2026 01:36:30 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c38e3asm151299535e9.9.2026.09.11.01.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:36:29 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 11 Sep 2026 10:36:27 +0200
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: song@kernel.org, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
	kpsingh@kernel.org, matt@bobrowski.net, rostedt@goodmis.org,
	mhiramat@kernel.org, akpm@linux-foundation.org,
	ihor.solodrai@linux.dev, martin.lau@linux.dev,
	yonghong.song@linux.dev, emil@etsalapatis.com,
	mathieu.desnoyers@efficios.com, hch@infradead.org,
	jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, marscheng@google.com,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v2 1/2] bpf: Replace sort_r_nonatomic() with sort_r() in
 check_dup_ids()
Message-ID: <aqO9iw319w0Z11U6@krava>
References: <20260910165222.1186628-1-visitorckw@gmail.com>
 <20260910165222.1186628-2-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910165222.1186628-2-visitorckw@gmail.com>

On Thu, Sep 10, 2026 at 04:52:20PM +0000, Kuan-Wei Chiu wrote:
> bpf_kprobe_multi_link_attach() in the same file has been using sort_r()
> under the exact same limit (1U << 20) for 4 years without issues.

true

> Switch check_dup_ids() from sort_r_nonatomic() to sort_r() to match it.

I looked it up and I used that based on sashiko comment,
it seems like switching to sort_r sould be fine

Acked-by: Jiri Olsa <jolsa@kernel.org>

> 
> This removes the last in-tree user of sort_r_nonatomic(), allowing the
> unused _nonatomic() sort variants to be dropped from the core library.
> 
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> Build test only

I ran bpf ci on this, it passed

jirka


> 
>  kernel/trace/bpf_trace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> index 29260951aa87..1d7e73ddbafb 100644
> --- a/kernel/trace/bpf_trace.c
> +++ b/kernel/trace/bpf_trace.c
> @@ -3826,7 +3826,7 @@ static int check_dup_ids(u32 *ids, u64 *cookies, u32 cnt)
>  	 * and check it for duplicates. The ids and cookies arrays
>  	 * are left sorted.
>  	 */
> -	sort_r_nonatomic(ids, cnt, sizeof(ids[0]), ids_cmp_r, ids_swap_r, data);
> +	sort_r(ids, cnt, sizeof(ids[0]), ids_cmp_r, ids_swap_r, data);
>  
>  	for (int i = 1; i < cnt; i++) {
>  		if (ids[i] == ids[i - 1]) {
> -- 
> 2.55.0.1003.g10538fe699-goog
> 
