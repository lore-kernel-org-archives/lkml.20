Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829378;
	b=oYvWDEasbZLsAjN5baMGGzUeX2SiXRoNOJ3QgDVhR9hZE7rLAacYjoYAROzF3SjnBSob
	 G3upaHVH6eCDnWEDwexwmOwagdhcBTWr5nk/42EnvLIbOrAIzM4SamEWuZn3IfNLNEy4A
	 u0GxGNQVDeRP4+GfLMdkOZz/+eM3QKZtBKomXdG6Xd5ov43nnwjgHfP92BJbOHV2MZkVz
	 HdwBtA8cjx4BYLoL+3zMJHYb6pll18Wr19j0faMB/K6zxScUy40BHAeLp3gVH2AS3OvKK
	 6qbqbmCMPBpLB1vlYPI0jGBFz23F7jl7oXjMfRgEv3W0wVlfLetdg+KxAlX9DYbCy0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=DAVS+080rf6STw++O+Ktz26PTMaNyuHuh8VnsXWcVTA=;
	b=CFAUuIpWOnoSXgeE9EEPfK0foSAzQw4NecRZ7zECVxO6ovhCHQQj7rzvIkDwcewIZvb/
	 PlXFJTaHQGh0q7eV7LYEkW1bWb6BkOnPEa7FO50HKRFpiZamvIRYa5uz8qyQkGX9iPgOy
	 agFhNY6L6xJsc+Dv/InqOcA7pRZin+Bp0vi8vQDghm0sb/LFnkoGbg+mNS5jewTO2FP28
	 3UIHGz8sHklMpLFWerhI8PzSLNtvXtFIuPxE86P/rb38gpRwxiw+Eoaymi16zsghbAba6
	 bZbJf+c1UA/fmWBiIlZVc/sBvlwP6G9mNCQ13aOhs6VeBSornpzTrZq7pk+iSqu/Tfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zZwHgNCp;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70853606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70853606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zZwHgNCp
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so1392902b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794829377; x=1795434177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DAVS+080rf6STw++O+Ktz26PTMaNyuHuh8VnsXWcVTA=;
        b=zZwHgNCp0kDTJAqMBY2Isy+TzBvWveIlg02slOrFeJNcGt5HPmU3Gzj3UZU+Ed002S
         8sm8qEyR82CT/iArr1A8dP4BMZhX4xZbv5x1MA052yRjv5N3SiDvURWWuAAp7yHoa98y
         1FJMAYbj7G8VPnQ4u2wVJvpQBvvvtPNyUcrdN/aqQYtuOvPW+hwmDPvU//sh7V4KwwDG
         WR4S13Tiik25jzUKzlAs5J7s4FuQ8VYt+ksmfpUNMrvMSgKt6WNmd/CwqQBAlIBsfOv0
         UlXI9PN2FmeqKfyN2/H07HcASv2tigDJ9Kfn8hMKU8kOcx1uEDn4cHnE2mgd+S3KEV3d
         2yEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829377; x=1795434177;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DAVS+080rf6STw++O+Ktz26PTMaNyuHuh8VnsXWcVTA=;
        b=B5fiwXOO0MZbCRqO7q4WIedTUoL8mHAuL6hJ3imUDgT07N92rE8N0hG19QstY017Wv
         yr+eim2A25eqBllebNdcE2MCuKfpdPHwH6rKq+zh3COXBjNFECI1ss7yWmCPGejhtI7A
         +RdHKoXhtwcuS2k4brHJrqgc8sqYQbB3+IVINMit04nHlA0oqblf2clbVMvvdYl4DUd2
         rN/l3OvnoQPbrhCzFhQuaA7MbOfdz9mHSnAyEuUgb0GcBP6+yD2yFIUG00pxFOB5AOG4
         kGBPPrm7ofJAlySV+DKKp/fSa9ucwfhV/GT9gAETAuu/AEGccHIbXYbF2OS+FU1XLijr
         kU4A==
X-Forwarded-Encrypted: i=1; AL+hErEO376mVc2Q54OmSazSKjRf3SGKY3uMfJAHm5VhUv93JavdGx3ZoiyJNC7mcIbE21S6ebkl/xZzZ9uz9gA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UQbxKvsktQajhDA905bqnBVM/MWCnF5CzBUBi289kPLR1JwYl
	JIG0nHsckHbmgv12oFg1IqwAvdBP75nazxPQOy9rvHrvruUMSq3yCpeDA5pk2x/R
X-Gm-Gg: AYBFou0NRFOYOVaCHML4gddtVDCvEQePW9+tEEXtDAS/ZHC6+F5ZBip/5UIMkaKMCAl
	dX4cYCfRdHHhZsnNTTZxgrsJkknTDA6FUmEqA7zoZfZl4j4AbGy6uDI1gV33nlwRGjq0FBnaft0
	z1UTPYMoWMF9S9WLEsX+gHp+msFfp72e82K/hRtWFs6/xySlpV/KuHxt+Ssg9jDTWBZsQJ5TZIT
	txCNLR8vxjvtq7YxE9yCW/E0IPN9Avjul+/3Jp2N6IDejWl8QmpkvcUmO4QCtNZt7awyEqw6cMD
	gi/158jR+VPWnRcwakED3AoOP8DTocFXxR/5hXLyFd1ntleD7rX3AhJ3OOHbvr2gapUkWWNnv7c
	Y6dvko2MncEfYGQgz1kPCcbWU9ZPFfTeEh8oa2XlJwNmBgxV9VlolUojH741Bv/UjNL6HHcOdIx
	YQX11pUe24VT++EpefwaUMzBDRAeV0i/JevNaCgjoTr4YL2sIgIc64CVWuTGcM3ZgUHCGdBhRbr
	cLjc7xVkMUqY23LfVMUgGJoBI5qoPoOqv9tF9S8MFQvzPZ3oNXgbrrw5cFvu2Xwc2S1i7UaeirI
	mM+6tG7svfluQgtz4Y5opnsHe0VtFsoP9r/Uup+BqbrAyFZZzk7arnH96yvaTrQWPF/CELDkjg=
	=
X-Received: by 2002:a05:6a00:230a:b0:8b5:d6be:3ded with SMTP id d2e1a72fcca58-8beb53d9dc5mr9471317b3a.10.1794829377516;
        Mon, 16 Nov 2026 03:42:57 -0800 (PST)
Received: from ?IPV6:2408:8607:1b00:8:401e:3331:e6b7:ac3a? ([2408:8607:1b00:8:401e:3331:e6b7:ac3a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececcce6bsm3527392b3a.1.2026.11.16.03.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 03:42:57 -0800 (PST)
From: huangzheng <huangz6756@gmail.com>
X-Google-Original-From: huangzheng <huangzheng1@xiaomi.com>
Message-ID: <d9ba27e6-45f8-47a4-b0bc-c9ccdbfd3c14@xiaomi.com>
Date: Mon, 16 Nov 2026 19:42:50 +0800
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
Subject: Re: [f2fs-dev] [PATCH] f2fs: add checkpoint step timing statistics to
 debugfs
To: Chao Yu <chao@kernel.org>, huang zheng <huangzheng9869@gmail.com>,
 jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20261103091215.180531-1-huangzheng9869@gmail.com>
 <b2253246-48ba-4c48-899c-9f568fa2df71@kernel.org>
Content-Language: en-US
In-Reply-To: <b2253246-48ba-4c48-899c-9f568fa2df71@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

在 2026/11/11 16:19, Chao Yu via Linux-f2fs-devel 写道:
> On 11/3/26 17:12, huang zheng wrote:
>> From: Huang Zheng <huangzheng9869@gmail.com>
>>
>> This patch adds detailed timing statistics for each checkpoint step
>> to the debugfs stat_show interface. It displays the time taken by
>> each phase of the checkpoint process, including:
>>
>> - lock acquisition
>> - block operations
>> - flushing data/node/meta pages
>> - flushing NAT/SIT
>> - syncing metadata
>> - waiting for dirty meta/checkpoint data
>> - device flushing
>> - waiting for last checkpoint
> 
> Well, all spot times should be consistent only after checkpoint(), if stat_show()
> captures times during checkpoint, the times could be inconsistent.
Fix by v2 patch>
>>
>> This information is valuable for debugging checkpoint performance
>> issues and identifying which steps are taking the most time during
>> the checkpoint process.
>>
>> The statistics show the longest recorded time for each step, helping
> 
> It didn't, it record the time every time, but only printing the stats in
> kmsg if the total time exceeds the threshold (5sec).
I want to check `cat /sys/kernel/debug/f2fs/status` to get the longest 
time and see the elapsed time of each step， as follow:
CP steps (longest):
   - Total : 524(ms)
   - lock : 0(ms)
   - block_operation : 13(ms)
   - flush_data_node_meta : 0(ms)
   - flush_nat : 93(ms)
   - flush_sit : 56(ms)
   - sync_meta : 32(ms)
   - sync_cp_meta : 0(ms)
   - wait_dirty_meta : 0(ms)
   - wait_cp_data : 0(ms)
   - flush_device : 0(ms)
   - wait_last_cp : 0(ms)
   - unblock_operation : 327(ms)

> 
> Thanks,
> 
>> developers and users understand where checkpoint bottlenecks occur.
>>
>> Signed-off-by: Huang Zheng <huangzheng1@xiaomi.com>
>> ---
>>   fs/f2fs/debug.c | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
>> index 6fe606e2c70d..8fd76a69dcad 100644
>> --- a/fs/f2fs/debug.c
>> +++ b/fs/f2fs/debug.c
>> @@ -445,6 +445,22 @@ static const char *ipu_mode_names[F2FS_IPU_MAX] = {
>>   	[F2FS_IPU_HONOR_OPU_WRITE]	= "HONOR_OPU_WRITE",
>>   };
>>   
>> +static const char *cp_time_names[CP_TIME_MAX] = {
>> +	[CP_TIME_START]		= "begin",
>> +	[CP_TIME_LOCK]		= "lock",
>> +	[CP_TIME_OP_LOCK]	= "block_operation",
>> +	[CP_TIME_MERGE_WRITE]	= "flush_data_node_meta",
>> +	[CP_TIME_FLUSH_NAT]	= "flush_nat",
>> +	[CP_TIME_FLUSH_SIT]	= "flush_sit",
>> +	[CP_TIME_SYNC_META]	= "sync_meta",
>> +	[CP_TIME_SYNC_CP_META]	= "sync_cp_meta",
>> +	[CP_TIME_WAIT_DIRTY_META] = "wait_dirty_meta",
>> +	[CP_TIME_WAIT_CP_DATA]	= "wait_cp_data",
>> +	[CP_TIME_FLUSH_DEVICE]	= "flush_device",
>> +	[CP_TIME_WAIT_LAST_CP]	= "wait_last_cp",
>> +	[CP_TIME_END]		= "unblock_operation",
>> +};
>> +
>>   static int stat_show(struct seq_file *s, void *v)
>>   {
>>   	struct f2fs_stat_info *si;
>> @@ -631,6 +647,14 @@ static int stat_show(struct seq_file *s, void *v)
>>   		seq_printf(s, "  - Total : %4d\n", si->nr_total_ckpt);
>>   		seq_printf(s, "  - Cur time : %4d(ms)\n", si->cur_ckpt_time);
>>   		seq_printf(s, "  - Peak time : %4d(ms)\n", si->peak_ckpt_time);
>> +		seq_puts(s, "CP steps (longest):\n");
>> +		seq_printf(s, "  - Total : %llu(ms)\n",
>> +			   (u64)ktime_ms_delta(sbi->cp_stats.times[CP_TIME_END],
>> +					sbi->cp_stats.times[CP_TIME_START]));
>> +		for (j = 0; j < CP_TIME_MAX - 1; j++)
>> +			seq_printf(s, "  - %s : %llu(ms)\n", cp_time_names[j + 1],
>> +				   (u64)ktime_ms_delta(sbi->cp_stats.times[j + 1],
>> +					sbi->cp_stats.times[j]));
>>   		seq_printf(s, "GC calls: %d (gc_thread: %d)\n",
>>   			   si->gc_call_count[BACKGROUND] +
>>   			   si->gc_call_count[FOREGROUND],
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

