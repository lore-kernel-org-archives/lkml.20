Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599219;
	b=5n4XmpQSVlNavSBv8Q2vuUwoGVsfll2jEN3GslXzNFcLizV4n2ppSb1M+rJYGVjHPWV/
	 kDu8PLygU0y+Dr7Dcg975VZeFIgKfLLZy7xuWW7ydvYulqZJJfR06pv9DtIx/++kq8TpS
	 e5hpruWbwjDwDvRzOzEkvIkixIxHt/ttbDTGFu/WnXgj7Th8MxTRpCHsUdpddr+siKZkb
	 wHQVVYVOumo8kacrVzrof4kP0x/dpXuwtcWQW1S3Cu4YeqDNm6jLJNCub8h9wNiwgZvyo
	 m/gfEjT2lpqbqADkecCV8Q5uPJEycohcoJdSx8P6Iot01atl11frEgrFXlRFC7kkJPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Dyq7CXm4eP3CnlrPx8cI2jgz3Z98ATLqm3BZ7cAURRk=;
	b=EkQxudSaVc+WFC1HZs0QYeLvHvl5Q46jJ740zEdjnX3ZLzF4UuWj5DHGXRnUar4WQrIi
	 0CCEhVWhuFsxm2Ham0gRbdKll49cEZV8bxvZ/ReSXC7Cxdg1mjk84yR+mnO1hLqWJ3dMH
	 XcSH2xa7AHf6zRC4ncz4+Tn/BHLDO9tpSsv8FT8jFHIpmxs9V/VLB5QN5i79uarY+oCYx
	 o0ahrkwEWIeWeaIWUJBDBN3d90DdFZis2S45DUn8omH8Jh2K0e3LL2QylBKJ71/KqOtjm
	 BvSMyd9jkTIdKZLkTXzMFMOy/FQnz8hIjLvYD+vws/KSKskQmxczUQMK5hp3JWFZ/Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uYl0To9h;
	arc=none smtp.remote-ip=74.125.231.133
Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com [74.125.231.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C0F606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08C0F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uYl0To9h
Received: by mail-oo2-f5.google.com with SMTP id 46e09a7af769-86203d56413so137194a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794599218; x=1795204018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dyq7CXm4eP3CnlrPx8cI2jgz3Z98ATLqm3BZ7cAURRk=;
        b=uYl0To9hjmL0Iv4ih6unVMewjNXsAQ0Q/B/w1GtCmtBTkPa/Jzq1VcWdXML3/xLbdD
         z9KTOryLFjWWGZs2LyuQUQKCL1e5CwKsIA1EUQ2d+j2dL4WZgIq03txDobSZQA7+cVFP
         7r5XywegOQBHmbfg8Kq/1AhI472mzkE8r0CKPJM+tN2L96ffWJ84JqfhK5L3ZppCVfj/
         PO0eyrhmS1iS/Zv9pGJoyFobw7YwrS8tQ/06HhaQcy56PIXgDkTIpmQaLsLWeHuDwwiy
         cDxVk8rg/HtzYpxTJ2Giu4JjV2rPeKjRVaXoqvqAvwF+pFEzM8xh9KKs43PXYYS99guw
         QV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599218; x=1795204018;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dyq7CXm4eP3CnlrPx8cI2jgz3Z98ATLqm3BZ7cAURRk=;
        b=AE7Ix6KGlnJIF4oYHqE0YwAJWKQZJnbyPj0esTDF7/T6U/GOgFGRiZkjxAjE4M9hVZ
         ZvdPuG4J976UgFbHISLNbOEDr5HJ9nm7Ii8xu+pAIlUFmvr35uUcQiIhMgLdVmdM66CW
         ZPThC4HUFoJ3sW0SBsN7OvqCetzuVdJpB8YWopUfRnZpxG8IDgsVlmcfX3cIdInwT67W
         E8BRslAUAW7PV7NjwPTdwRxeCspHAuHtpXxsnzoHJlQ8+bVbtv3k7e4f7LymqW78bD3J
         hJZPo1CWV8HDc80uE0sk6VtOlmrkkd+OYRPcRroQirjK684tUyEW98VOMEAdVsfzzQ3w
         dGNw==
X-Forwarded-Encrypted: i=1; AL+hErFfw84srPRvBD8aImYiMZ1ihdPhl9x8adwFoOH8C7iEe5gj4TRyeYNlAQYGYgPQi9XaJctjKeusiAi/bzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z84zdZS51E+FvkghghqbNvbLw7XCYkUUleQSL++8nkuZeksF7Hn
	r/p/830O1pR0jkr9+te9+a0lgcvMh4UU5/OyYHYbKOchACh59NfdaWlK
X-Gm-Gg: AYBFou2pWjU9rQ19dpxmGHoViaJ9Ki3xfDIJZ0kr+rGA3VCWhEq6gYEVrDo+fJ9ZU4V
	hiGXdCthcRoSTgeFZbvwhMXYbpwD1sw43B2aZZLwFtBt++2FioLfwmYGakPTs6D18TgxBLhGizT
	ujbSofnZwOt9bbBXk0IT2CGlTE3enjzVf0KhIyBMUGE5yeTbv5JIhw+HXhm6YIoAqFSIn0lieq2
	yich6oEjb1Q4MW40e6BbTflf22A7gi0qc4mrBl85qxKBdSw+Cj5SNJjrdbXLvVnxwxFLgiBo4tg
	ZIVuJtFIlaqNAxDlOBNVhvFK6BDIvB+0mjoX+e+06y9q5uA3bfsUKSAGkqzcAhxZR6IuODNSJkG
	kAiLNkDd9kWOibSXk0bF3sLIK9AsoKrcf1Txyx99TTzVA4bjGbYOz5q8KzGLlcRDpNs8IdsFWnJ
	8tGgXUf+7Ug+fZVGTk9YhvdKMz69lXlHez/3zEpAVHsiyiC+VprMxAiiBTk9PouC3H6qlGBN7I/
	njmb22bC/qiaHvSQI3Ya6flz247yEgfO71K4vJI2I/6QSlnFt6qmgOFlybxbI7gLldNJ1BFvH6L
	5lcEhLDkmmHcUMmKBD1xcTuFRfx+Cbd2ziVABTsbiqy/3fqnmXS2emIHxuyh7KT1ErWHuoNJRPE
	pRvdQIWbu7TvPy9LCmP45
X-Received: by 2002:a05:6830:4421:b0:862:a0ce:f55d with SMTP id 46e09a7af769-862a0cefa5emr249700a34.21.1794599217866;
        Fri, 13 Nov 2026 11:46:57 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8629d280975sm811328a34.21.2026.11.13.11.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:46:57 -0800 (PST)
Message-ID: <9fd550c5-292b-4974-a667-9a6f33f2528a@gmail.com>
Date: Fri, 13 Nov 2026 13:46:56 -0600
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
Subject: Re: [PATCH] pmdomain: mediatek: Don't power cycle domains on probe
 deferral
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Enric Balletbo i Serra <eballetbo@kernel.org>,
 Matthias Brugger <mbrugger@suse.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261101-rbrue-suez-upstreaming-mtk-pmdomain-defer-v1-1-b4c41cf3935f@gmail.com>
 <CAPx+jO94U8b_PNJbbuzzFtF2HFeM7sYaT+oZoLJUfvThXkFYjA@mail.gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <CAPx+jO94U8b_PNJbbuzzFtF2HFeM7sYaT+oZoLJUfvThXkFYjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 11:48 AM, Ulf Hansson wrote:
> This looks good to me. However, the patch no longer applies to my
> fixes branch, due to other related patches being queued.
>
> Please rebase and resubmit a new version.
>
> Kind regards
> Uffe

Hi Uffe,

I have a v2 already out at [1]. v2 should apply cleanly, but let me know 
if you'd like me to resend v2!

[1] 
https://lore.kernel.org/all/20261110-rbrue-suez-upstreaming-mtk-pmdomain-defer-v2-1-3ad9ad0cc67c@gmail.com/

Best Regards,
Ryan Brue
