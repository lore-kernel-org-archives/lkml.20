Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420422;
	b=x9vjGUqQUUh2Sx9TQ2Nz1qsKE7aISNuDsQMWqtGgyvjQRNN2N9Jwy8SCNzcRJA5FPN+3
	 py6Oh1Qfdb7euLlTEIr4AkLhU//O17+Btm/xIwvOaZlwQC/JOVFTTPvMnxxiedfQfxZ0m
	 g1ZJuUfyrBaXNr08spMKGyxI1GddcnbDm4aupo2ZYImYMFMb4Xa699ba1WZvQoyUgkRkI
	 kMH0eZXHEjdZN0T1ETYXXlmJoeoWZium4DTXvHLDsFeXdKq0d4oPFHaIlBmM28CnhoQpX
	 EAblqFMxsKnQaxf6UCNuReSzmUAluWi4Q+KlLmFDB05mr+CAiQgbjwB9Xuw1uZTsytA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5EkQQnjmN4v5cLrBthc4MAXsVOryIg+2+wQmH6Hq2Yc=;
	b=gczDZnfN4iDm35ZBiGd0dwA0BF34PxzW2rjyrIMRtBjLgu6qRgZCdSu80Hz4QqZkEQfF
	 7I+CFaW5nyGsOjuiO5LkEM8mL/ES/K9oB4+JMJPund346GVfxXVGN7esI0p7bfe21SQty
	 v4H/ifRvZr9aYeL4Bp8f3Bem2rxicTwMZmuAMP9OA1dB3CrolzSkqd7Ox4q3193yMizBJ
	 XvXS9pwHN6iCOqM4Evk1TlfQHgjpPA093+P/VEjWTI4fGffE1wy7UWkacs1fgkkxYhvxL
	 UuD2jCy/7++aWjqWbCwF1Mxh5ZhSJKuPYqzL2zxQRm5jgjVKtv4K3DjwYFM6Ev8ZIpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OXE8xVcH;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBAD606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DBAD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OXE8xVcH
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49465892f7bso2506678f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794420420; x=1795025220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5EkQQnjmN4v5cLrBthc4MAXsVOryIg+2+wQmH6Hq2Yc=;
        b=OXE8xVcHlE8HwQDm0SC7DnfUf9tLGIzpJ0FEqU0jrOo4kDlKKUykZNXysd3AA5QBw6
         Et+TZ5ayhWYC6yUHo48C5LW1hO++ukQbvv6QYAr1hY6RxpHRsC5fEg8NFLYhLFZayfAw
         mbHzukx+GWzZ5ts5XU3kkHxOsDBLjzl5K4BFHLKvS/4Pvsm5wsqh+Wxk5frTqoj9zdU4
         THPcwgkmgzKx9otykclh83IGFheIqBVQt8Yvv3P8o3Z0AQe/yxnXAoqrE7D8hrKOjzdR
         dIrGWRnQ+02HzqASMV49hCjTjvXO9szC+P1G5XLkFAQy2V/Q2NR4NWVFZ9cdJk7kaDSt
         Fz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420420; x=1795025220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5EkQQnjmN4v5cLrBthc4MAXsVOryIg+2+wQmH6Hq2Yc=;
        b=I46wN0JlREG2RHH7FTuu8kwQlBj2FLwfmI3xMjQPrffe0mdd1b8L+6T/X7EgF+oqye
         /ykChh44IJU3IE8SA0xGGEeBespjpPotPDf3dCxYT0fvJxzoaEKgBhMbt2yUVLm6Pipb
         WQhWdh0A+BuKySRpKtKQELYxWxDns0l7Sj5W91VPaAPWqbl52gNCBxn4PhZJ4msKOHT4
         KJK9+dNx26D47Cn4oix2P3QfRRPpZG4WBVzAhBWgHAbyFssVe8xmRlpAMo28qiujZYlu
         FOAMb8Q62dOzXdB9jrtUYVFb54LfPe7PbMQdPaUMke37rPhj7lfqtc7DM7/thp6X9LsV
         sXDA==
X-Forwarded-Encrypted: i=1; AL+hErHwmYZmDd2+NiR1eUXBMxZUZk40jkL3Hmsf5W7UOr3E6zH9LrOhkZpcKIRVrxq26cRPlaouysIidquP1u8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YpTgLLFFYzobEngKePfuUCur2wNwOWUCXPop/YsYTdodMyKeH
	IwSNtOAqHcbOsMzJWGW+Xvh8KMoKu1euI7SN5khXvkC301rxsBeCo/9H
X-Gm-Gg: AYBFou1oMkFS6O6tZx1ksfhhXa1h94YMXNLKxttGMm2OWpFD6qoabuGkmzd9creYif4
	vyiz/pkd5iqPQ8aGxhByD3wOv97/H85aKQ8B8LRQclb6HFdvAi3ahcRMWarWCNOq31yxjQ5eZLo
	7FaRSzfuXoaYM/LxpIKtBmYQ2BnGxB2281gEPDKSMCSRD6LFptR/eT9KRhlVpr52FGghDxeXWIf
	6iTNb8/Buj7XEu1RhSkfif2V+HEAllJOzREGXmXZo5TsP83/hjpuEnFI5a//Wjikv2aUSpeOZw7
	fCzvMLOVTBXgH58fZHfa/VQ1JBalKF+G7slqkGolGI0PTiXhnf1U5sxVPT4xW9J3z4KPMaAwrjQ
	+qmWNlA6MYcO6tn2nRVpnbb+22/iitlbcTbnNMtlgfTKcJK5ImjRJ4em6h86vEBsN0IaVQsekKq
	zPWMU0zF3dDAeE0QzPLBeIOox+szY2rq+VF3tUfHLardh4sv4suFY3tWw9jq5zjgAawNEXcWAQ1
	3D+nj9fdpBVLwQuGY7sq19SvAHGBpm4i3FHYRDRfOT8xNL9zJINpKhgC9ilKw9ORa1HhxLWTRi6
	yOexqTT6ioYHolFBIkx7z+oUAgT3xx4hao2oV+JX9OSFdcNLue0KEn4N1GchQa1D5tf0jia6Rtk
	CDhw+wdfjVw1+6w==
X-Received: by 2002:a05:6000:230d:b0:48e:3cec:b852 with SMTP id ffacd0b85a97d-499c7087c01mr6407400f8f.40.1794420420284;
        Wed, 11 Nov 2026 10:07:00 -0800 (PST)
Received: from [172.31.15.113] (6.red-83-60-147.dynamicip.rima-tde.net. [83.60.147.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365cbbe5sm13633793f8f.42.2026.11.11.10.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 10:06:59 -0800 (PST)
Message-ID: <f782318f-5ecc-47a4-9bcd-98b7aa696731@gmail.com>
Date: Wed, 11 Nov 2026 19:06:58 +0100
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
Subject: Re: [PATCH v2] hugetlbfs: report inode limits without a memory
 subpool
To: Hungyu Lin <dennylin0707@gmail.com>, muchun.song@linux.dev
Cc: osalvador@suse.de, david@kernel.org, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, jm5905938@gmail.com
References: <20261111130145.96534-1-dennylin0707@gmail.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261111130145.96534-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 2:01 PM, Hungyu Lin wrote:
> A hugetlbfs mount can limit inodes with nr_inodes independently of size
> or min_size. hugetlbfs_statfs() only fills f_files and f_ffree when a
> memory subpool exists, so an inode-only limit is enforced but its inode
> counts are reported as zero.
> 
> For example, a fresh mount with nr_inodes=4 reports zero total and free
> inodes instead of 4 and 3. This hides the inode limit from tools such
> as df -i, even when creating another file fails with ENOSPC.
> 
> Report the inode counters when an inode limit is configured,
> independently of the memory subpool. Preserve the existing zero and -1
> results for unlimited inode counts.
> 
> Fixes: 74a8a65c5261 ("[PATCH] Fix hugetlbfs_statfs() reporting of block limits")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> Reviewed-by: Aveline Noir <jm5905938@gmail.com>
> Tested-by: Aveline Noir <jm5905938@gmail.com>

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
