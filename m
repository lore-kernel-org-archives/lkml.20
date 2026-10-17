Received: from mail-oo2-f6.google.com (mail-oo2-f6.google.com [74.125.231.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D127331EBE
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792278201; cv=none; b=dFZDfO8kRz4OiB8wH8S58NgZ9nH9g7QbTPJ5W/3MwpkzQdKmI5lR5SbtY9aXPU5JyPLyOm3YVGW5lWxuB1Arr6Yp5xhWYDDApqZqyzdm4CVbvjY3a1uLPN9aMx057Ls9lciWCv04MN42wuTW6idglKwc59tPPHUdERy7cqwoH3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792278201; c=relaxed/simple;
	bh=MLc9D1DEZEG21UdK9zKmklHWb7giJ0sQGdAxepZIqTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TDW1XpG595e4fkDM/b2unqbK+n1GtmAgsctfiz7b80ETfkKzmLhINTfWlbhLlGYQcR9RDsrvDzOXZIr4nsSlEYuDOz2OH5T8H5zFObW5g0iyEOfflv6D3GC4qkLU1zu3xCSxak98Teia7z2QDTL8JixfqrEyhg4CwuvioS4Q1E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDEj+9fV; arc=none smtp.client-ip=74.125.231.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDEj+9fV"
Received: by mail-oo2-f6.google.com with SMTP id 46e09a7af769-8217177c5daso203527a34.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792278199; x=1792882999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NIfxed9xRh6p4p/w17T6098/U45mW63EwJ8GFmqGUTs=;
        b=XDEj+9fVQ4f+AMTw/Z3zfukdvty1yhpqCvjyeDQo8X4HQ1vgjuRnL0K5hVcxX2hcf1
         S88iYGV1IjiTE31y8bXR053avMnC3kK2o0IjCEDfTHyOxNOu0Dl3/mWq87Ws7si5H1sY
         cBCngCJPic5LHPly5KEzuCgx8jiMuSjya5LXCLxdykJhJnoYvgcOdQc6yadpewSk/gLr
         c+RGU5+Xd1QdroNeRW68KePqadqhtq2oGmb82RnigWL3MKxkRRBBZhJAmcHFSD6s3CJQ
         b60Nlrn39PW7hZ6awpVs4yVyrouY19j4lZh3yJbpfzKoLEC/mRr7e6BMtHHFOlP/kpQR
         TCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792278199; x=1792882999;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NIfxed9xRh6p4p/w17T6098/U45mW63EwJ8GFmqGUTs=;
        b=Pmzb1DQB7ShRugfvwIPbiYd5+eSbr2CLMfeL48AgbCxyQHHByl/B7GDcVIpNQf9j61
         PotCtiaLDE2rXc1ecmj1Tn5l47yf5MHFPTwL09s1Sb/9/jxjmmAbCf0AnUwhE2+s5WeT
         4TaPUjDhlaShNicudiFJ+0+abRmeZ9MC1JHVtpmCUC+yWsd0kgmJn7KGgLDpZ93izjd4
         STCsw+2yBKLBqWet5cH1vXa3UJnuMHljoOKMpH7vJ4iBphzClFirfa8kJq88A5cLN5E/
         jzRqTMNtEKavTZ+O7Ef3Zj/CHAf8seLRv5nVwd4UVzIO+UgcoJiEFll94vbHLhTSVoL2
         P0nQ==
X-Forwarded-Encrypted: i=1; AKwUvByMkgdHG+zy3670Sx03nxq5pBCf551CYWKiwVVg6Nuzbi7RhJHpYGevNHh4OcsIx2VuvkGYwpF8DUUjvKY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsj8C9Lw+9xKAiEGdbMKaJSqIxiES7xlLwG8TH+i3eC9jwKSGv
	N6Na7DxL0tudWAVaK2mBXone5En0KtM9TSDQwtlpUb5s0KinOokrkzZu
X-Gm-Gg: AYBFou0ZsrJL5iWQ9cLYn2iKdK+6I7DuPJ1kq46szq1+vr2EJ7bEU0mqX9nMP6EHiwv
	hMd5vydbG0zyGMZBf7HnHsPlnlxkJl4YlaM4q6lmmCQsN0PFzMFz/0pld5yljWZepYj4dbJWkfh
	IsarbWORY7taHkUe1M7aMerOTcpiSqYga9JHXDRhAMaxrI4iYcqNxJOvPboqJVZgMnFcvfFan0/
	qMDYWjzjRoQMAIvBUAQJqVB/hzp2Fya1UFGV0l3pyVUp1NLUgrXsNUvF/rS/DfP3THh7vxyZTc4
	IBXTnNAcO2OgceOX8cONAPp5vfmO9LzzjdIEVS2VISVQwUsGLWIjDadetBDxbDXa7rTuHwJwDC4
	j5eWIoqQUij5BrVvGgnvXo4o3Ht8OJUaKyEckuGCWhO82cMZUOBnTnhmhbXtPJtucm2NUkGIL+2
	K5Jb3FerbCCfzMqDNlZiw1vvPrd9AYSeHxeD4GEGLmLSxt2ytPVtwEKlv8w+d/vcaJbTnrsgEKE
	T5zvsrnvIW/U0w=
X-Received: by 2002:a05:6820:1529:b0:6cd:3ffc:64d7 with SMTP id 006d021491bc7-70357a97e02mr2235388eaf.82.1792278198975;
        Sat, 17 Oct 2026 16:03:18 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::2620? ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70190c1c106sm4927968eaf.12.2026.10.17.16.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 16:03:17 -0700 (PDT)
Message-ID: <e8389c1c-e858-4171-adff-5bd94909120c@gmail.com>
Date: Sat, 17 Oct 2026 18:03:15 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask width
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
 <20260912-mt8173-fix-dds-mask-width-v1-2-3d0c0292c85c@gmail.com>
 <88272aca-2a9e-4a75-b7f2-4f7aac8b6d18@collabora.com>
 <1j33ux8of7.fsf@starbuckisacylon.baylibre.com>
 <12e0953c-5181-45f2-b409-05163ab2a031@collabora.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <12e0953c-5181-45f2-b409-05163ab2a031@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/28/26 7:22 AM, AngeloGioacchino Del Regno wrote:
>
> Please collect the changes that I've reviewed for this cycle... I'll 
> start
> sending PRs from the next one.
>
> Thanks!
>
> Cheers,
> Angelo

Hi Brian, Jerome, and Stephen,

Gentle ping, in case these slipped through the collection Angelo asked 
for above: this two-patch series (FHCTL DDS mask width, mt8173 and 
mt6795) and the related mt8173-mfgtop fix [1], both reviewed by Angelo 
on 14 Sep. Neither is in clk-next yet, and both still apply cleanly to 
it. If it's too late for this cycle, just let me know, and I'll ask 
Angelo to take them in his PR for the next one.

[1] 
https://lore.kernel.org/all/20260913-mfgtop-no-clk-api-power-on-v2-1-b84771a3d5bd@gmail.com/


Best regards,
Ryan Brue
