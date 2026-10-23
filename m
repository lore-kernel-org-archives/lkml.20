Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792783949;
	b=ZVBjsi055aTrnS6GeYEj+LkecCisyyAgG1Mxbe+lQlTELCb30hwYNowTeXkvjBICqEqi
	 8QjwWr0rolSgV1vN89mfpNy1y98UBs6F6rPbbk/S7SGWQtSWZ9g7P3GrcW321yZ9z8kNN
	 a8Ft42tptXBrW5rVixCAZXpliEAnjkVV01YtLJEenuKkeE2VoDJUV8dmfvgMX/PZZFEvv
	 OT3Mr6lth1Afgafv6ghVszSGfMdhkai846JVXAIt4JT9suiECghPZn+0lf7HOQWzWN7Eu
	 GoozPU0nP9EUhNj/vpl6rSw44K2O1PEJXDfJlEQtkR4puJfCMs2s7kGfQECD/awaUdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792783949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xQ0ZY845r5Du+UUOa8gVSKQGxBME1IJCKr0CS/df4CI=;
	b=ncmuacS+VqTuL2IcOFp0AWKoe49tiE/qZe/WrVB/zb8+e5flnUDCY0v+q/gWs7XIBlow
	 PuTaSIybyvLHX19Pip2iKyfcphcMuVLhBslhUZfdjE0TFc+LYk0m/Z3Yv3BflZXpkom/G
	 zwWClJ8ej1Rnt7wGxDw2t1mdLpiRl7e6IUr9+Y7aqxiT2aRV7wzf319SE7eCmBs/22nYb
	 hqwZeAKG5tSsnryuOwtrLISqnpUpVy0tMqQcK/YuuooaizRseCMH053wUuUczWBeJ0Jap
	 YWmdI8zgu6TNzv95cMAWu8/luc+ONwpjtJtNnowszgc+y2kPABhL6pVNOWWVe5qRXUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=colorfullife.com;
	spf=pass smtp.mailfrom=colorfullife.com;
	dkim=pass header.d=colorfullife-com.20251104.gappssmtp.com header.i=@colorfullife-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=IJwkHIua;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EB4606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17EB4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=colorfullife.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=colorfullife.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=colorfullife-com.20251104.gappssmtp.com header.i=@colorfullife-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=IJwkHIua
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so2169845e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20251104.gappssmtp.com; s=20251104; t=1792783947; x=1793388747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQ0ZY845r5Du+UUOa8gVSKQGxBME1IJCKr0CS/df4CI=;
        b=IJwkHIuahlX2XmMgrR2c4biFHA3eskauE3h6uVTKAANKlsfhz+huia0jeSfgkqD9te
         yCHvIxkXbcIe6zPAb07HORwwUJqgaZefo4YbLOzzVt0oVupxczkq2SHcd4b0OcoBOvWM
         3hYL93P/HIN94qL9lwUvUC5EkzVD/PRGBVNzmk9ednVd+fxpxY4wdyYivid1PyYPuR/U
         KkvmryC9htmaxcQkhC7Z5wj+PycuqCkkBhTg8wlkegLM9BKUZbGxxiOAeLS/Slj03CW7
         kfgNpCvh5LL/du8svsYwsDWWot+MJSqiMqNUbx4EnApPLuFlFacpkDj3CP8OGcXutRx6
         WbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792783947; x=1793388747;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQ0ZY845r5Du+UUOa8gVSKQGxBME1IJCKr0CS/df4CI=;
        b=rVnHRS5mfsmOAbeOoRGw9TI77E9PV37Rlvrl0BGz+FdiC9cSa8qnrgPamjXtDewYKR
         mhZKaFxavgaI8AN+DlhtywlivLzXs27UFDb+zGj7VJkYtEcS0NPaDIXTkADJkhPmqQ0n
         NcGQ6ui0tKxGYUEMGK07zdohRNR08MUWbMy+DRP+JwamQhlr5svwOKYwkk+ApSmRcNng
         vzr/Em51zMywDNrdj3JNaWJ4hh8QxPz1sWoSRVpzjHoQww3AzDuO6VGl4w1sAC4KpS14
         h+MeVsjigTgJDvCas6KRhNOQYJZvGaNh/+18rd563IaOBYpCPns18Xijjwp8DOp81t0S
         D/5w==
X-Forwarded-Encrypted: i=1; AKwUvBxS3WteWlVId9GRBOrQQgzx8A9WC8qNMVVUs8H2Ry8NAnqLNV4NT/SQzUxIbg4uEFMGiSFwRXv5vowK6lA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2+A/B96Tg0KzAi2m3FeYyxynwjM0snOk73Kgr27tJj/ZexbH0
	ZX/Dm41/rzlwTM9eh8qPnuzX9K+h711MkNA55BIBZ/c9Z/3R4p6pS6nRFPQ31aZ4xw==
X-Gm-Gg: AYBFou237zi5cRZ6S/14ctJAXRuEBlyBqiOzIKfbCjI3VTNAAJGAc/wJGJBEH1alSKA
	vWeY2vC+GyyiqaPM+821Y0999NAuiSBP/hLFZK+Asn25cZNj11COXH2eZy9c2qX+30d3FWOfFKL
	kkaHY5I/16MlClQLwAl+FVSXBwCytH/rLRzshANyrtcr+vSbdA/VDlt5lZFIKrFJotIKZzHA5+K
	1m0DYMXYTFLTFxhKjcJcjImHZK7hlnfEsx/wQcaLk52PoWKnTEtxlO3yDEw9vtf3mEQxMg2Gi5x
	7WHuwO8HTK6OOfsdfIDEUNi4rK9VKbtF/uopgixtaNiqQu7u/1hW1Z/bjeoFxXzcdDPHHmIhYpw
	vBLpDRtRD22Fxw3wcZCGOI8P1TzkRyLlE/0udOtY7/bs/TvRWtZOENp0w1KT3IvIXh8Sc3Avkl9
	R+i8iqEmr/PC2HtSFsD339HXuxJ/IwwLwnAXUDKBH7r4cvA6930C0BmARYJ/HfIxlBruwGoGZt6
	PbhWF9IpqSOQKAHbuBG/ue+90dmG3+RsHD8MrmhWc/VwcaBmu6q7uYjBMMnO0FW4TXx39IzOFKh
	4QINmVF67btwpPtsxzpCj4QTCI8VsyLe03oEgNVEpzygLMsNLLTfXv94nqd4It8q74kEAqigv69
	mtdp0tCsCVNEI/rs=
X-Received: by 2002:a05:600c:630c:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4a211c64f9emr57232995e9.4.1792783947346;
        Fri, 23 Oct 2026 12:32:27 -0700 (PDT)
Received: from ?IPV6:2003:d9:9707:8b00:3fa:3a3e:198d:ab69? (p200300d997078b0003fa3a3e198dab69.dip0.t-ipconnect.de. [2003:d9:9707:8b00:3fa:3a3e:198d:ab69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fb08d5sm14180055e9.1.2026.10.23.12.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 12:32:26 -0700 (PDT)
Message-ID: <9a3aa73c-7b62-4f1e-983d-cf22d45ad86b@colorfullife.com>
Date: Fri, 23 Oct 2026 21:32:25 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ipc/sem: remove obsolete SEMOPM fragmentation
 warning
To: Yingjie Wang <x-professor@outlook.com>,
 Andrew Morton <akpm@linux-foundation.org>, Alexey Gladkov
 <legion@kernel.org>, "Eric W . Biederman" <ebiederm@xmission.com>
Cc: Vasily Averin <vasily.averin@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Shakeel Butt <shakeel.butt@linux.dev>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Michal Hocko <mhocko@suse.com>, Alejandro Colomar <alx@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
References: <cover.1792724953.git.x-professor@outlook.com>
 <cbd5dc183943d2177e5564f6e8ec92499836c7e5.1792724953.git.x-professor@outlook.com>
Content-Language: en-US
From: Manfred Spraul <manfred@colorfullife.com>
In-Reply-To: <cbd5dc183943d2177e5564f6e8ec92499836c7e5.1792724953.git.x-professor@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Yingjie,

On 10/23/26 5:19 AM, Yingjie Wang wrote:
> The UAPI comment advises keeping SEMOPM at or below 1000 because a larger
> operation array may fail due to physical memory fragmentation.
>
> Commit e4243b8062c1 ("ipc/sem: play nicer with large nsops allocations")
> changed the operation array to kvmalloc() specifically to support larger
> configured limits, with vmalloc fallback when a physically contiguous
> allocation is unavailable.
>
> Replace the obsolete warning with a description of the compiled-in
> default and the runtime sysctl.
>
> Signed-off-by: Yingjie Wang <x-professor@outlook.com>
> ---
>   include/uapi/linux/sem.h | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/include/uapi/linux/sem.h b/include/uapi/linux/sem.h
> index 75aa3b273cd99..cfd772f4c3396 100644
> --- a/include/uapi/linux/sem.h
> +++ b/include/uapi/linux/sem.h
> @@ -71,16 +71,15 @@ struct  seminfo {
>    * The values has been chosen to be larger than necessary for any
>    * known configuration.
>    *
> - * SEMOPM should not be increased beyond 1000, otherwise there is the
> - * risk that semop()/semtimedop() fails due to kernel memory fragmentation when
> - * allocating the sop array.
> + * SEMOPM is the default maximum number of operations per semop() call. The
> + * runtime limit can be changed through /proc/sys/kernel/sem.
>    */
>   
>   
>   #define SEMMNI  32000           /* <= IPCMNI  max # of semaphore identifiers */
>   #define SEMMSL  32000           /* <= INT_MAX max num of semaphores per id */
>   #define SEMMNS  (SEMMNI*SEMMSL) /* <= INT_MAX max # of semaphores in system */
> -#define SEMOPM  500	        /* <= 1 000 max num of ops per semop call */
> +#define SEMOPM  500	        /* default max num of ops per semop call */
>   #define SEMVMX  32767           /* <= 32767 semaphore maximum value */
>   #define SEMAEM  SEMVMX          /* adjust on exit max value */
>   

I think there is a conceptual issue, but perhaps it is today not 
relevant anymore:

The values in uapi/linux/{sem,shm,msg}.h can be adapted as needed: Just 
change the values to what you need, compile a new kernel and you have a 
suitable system, even without sysctl compiled in.

Your change breaks this: SEMOPM is both the compiled in value, and the 
implied limit when _ACCOUNT is used. If someone increases SEMOPM in the 
header file - suddenly more unaccounted memory can be allocated.
Perhaps there should be two defines: SEMOPM and e.g. SEMOPM_NOACCOUNT?

SEPMOPM_NOACCOUNT defined in ipc/sem.c, perhaps 500 or 1000.

And SEMOPM remains in the uapi header file.

Minor point: So far, the format of all limits is identical. Could we 
keep this?

#define VALUE 1234 /* <= 4321, due to whatever reason */

Perhaps something like:

> -#define SEMOPM  500            /* <= 1 000 max num of ops per semop 
> call */
> +#define SEMOPM  500            /* <= INT_MAX max num of ops per semop 
> call */
>
Reviewed-By: Manfred Spraul <manfred@colorfullife.com>
--

     Manfred

