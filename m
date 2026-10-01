Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCC13B71DB
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790835906; cv=none; b=on/rlHa2PHEyWvvjChGQ8wt3dAlOzpWe7SMYb4qKMkB5Jm1hQNfzcK2Qp/l/Y96NIccTvRG9uoy5/HK63VPuUflZwXCO1D5ZH46DZ7dyuJ82/GQrKPFslXZBWlYIQsLWq5Jk93P+0oQYW+/C/itSDIiKeCT4ZHq2uzhBI7DfoDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790835906; c=relaxed/simple;
	bh=CuIdV5VrftBCONiR2VTHvhJ7dRW+tausNZFIdyCd3HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkXBxHttsAn6YIMe1eQ4kYZrSGiR+GGmHafDJYA2y9N6dhqg8oJmBQGRsPjw8bCtlRWnbCVpW9uG6VDCQSdSlpYoy83KeF0nRT3iTYa/jyUymBeMrMH1smjlwFJ9+tB39quUTLBt0pzMWgr/IUmd4aucdmNyVZn/3Zu8FC4YdT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d0ZJE6hL; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d0ZJE6hL"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd046b87so4722144c88.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790835904; x=1791440704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MWianhRz6JmVZ+t3LJGj+9gNABxqIeJX31Clh5irBFc=;
        b=d0ZJE6hLlYbQhWiYykk+skL1mtK05Yn911sIN6RJPck4KZ06U+nM1DeDwtIHhZ4uc+
         IzDWGDtT5/FTj8LeSY3HJgW/Fm2NXm0doaAeU9tr5D/OBknvMQJA8RjTuXVSsyoJn6dk
         WmwEBZotJr/P24mcigPhBqqtrJUyptd56QLvlfBMt/NBLCDxu1xAEWd+SDHfuNXd7mtC
         g53aRwX39nlUHE66E7K3OMyGXh40ek9EDZGFKoS53MjoaOm3f6hhHRMP6vwtjYhyVK3B
         o0EqodMzU0XMw24/c+Z2wcnsLNThKQ/uVcPwrnejfmB2KMHNYJWxiDEAmwmtm6o0SUP2
         o4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790835904; x=1791440704;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MWianhRz6JmVZ+t3LJGj+9gNABxqIeJX31Clh5irBFc=;
        b=UQKngotQ+bgvpwKri8GcJNmUS9l3L7RRCs5Dfe5l2JCgh9HKUssohpVRlDjtsTN5m/
         HLB7jyKFLizNz0KaypjQV6Vns0dxrHSi+AycTqOFFwY6qVfaYqUMkWPhZEQW9VAIs2zv
         sE6/V3YOtJGDSY94ckGKP5LXNdtFDGF2EfchNT6Fnx+2lEhuoJbk7/xYImjc7qQkN9pn
         +8CphnaioYhozVJHpp1op/EgQicQXIWDYCY/nIUEyPJvndUkDMYIIplAFJj97toir4Sw
         XeEN43uaMApIsmSIEa0xT5fcIetWDxoWOXVoxUQ6mQ3LQF48D0ZAoczMC+gzHACwRXnz
         CwCg==
X-Forwarded-Encrypted: i=1; AKwUvBxb89we/ggVajXoMjtz8cfqJju7+2eZDGAy7siegqbJeImQnkuCTaGQBfXAtXlbwN0tQSmZFRcxX7jKNzY=@vger.kernel.org
X-Gm-Message-State: AFuF++lN8oMH3Cmk355uu2n8bpRqDsH4o32VwiHUmnuegGFJtZ6PiZiI
	bHMeKkv9bQQuDh+M24NZ6xB2NrTfB4jhFtt16t73w4M5fbP5hbp6q2jjSyIJvhX0dfw=
X-Gm-Gg: AYBFou03ljbBIodnxLVDFouPEzQu+/ROpMXhmhJZova7L8GKfKkhw0J54fJl0d9poqC
	vQb5zDnYzKqzzxQ1luQbUuxL/ysfxNta8uRvTw6t339sS/yDp47JFBMPWV4ZL7mbN6x9H4z/fQ/
	hqANIe/OaTREyja1eNOrJazj4zzfInAZmEm4I6hqFkIW2H3V9UrXRKhttxphRsKVmrEnwRsXJNi
	u3ZWEkmCBYnNiFrDjE5s+9MEg81u9J4lypB6c6OnYtrkyALzAWBrkokTfOiNvLi/GDSdqNQU32H
	9hMzSmSvt0eAXiZ+javX0wvG0walCxc6kAtJTAdKkeRyrIdmZfI2ccCwNngT4Xo51cLnBpjW/Oj
	6yyjz/0/c1ZaOm1ZbVM3EGqEvYS+iEcm3zOApKdNTH2uzUQMnK5Is3QrkN0YbuZhpTgT+YONH0f
	j7Z2scjiUb3jHb5B5gN0tr3B899vPz8KlhT6r3hmjlEdr+VawWdnf6elpSWG1gAmwf40lYLeNLn
	Q==
X-Received: by 2002:a05:7022:299:10b0:14d:baf5:c40e with SMTP id a92af1059eb24-14dbaf5c56amr1838510c88.8.1790835903723;
        Wed, 30 Sep 2026 23:25:03 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14df359ee25sm5135037c88.5.2026.09.30.23.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 23:25:02 -0700 (PDT)
Date: Thu, 1 Oct 2026 11:55:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: spidermana <xuyiwen14@gmail.com>
Cc: miguel.ojeda.sandonis@gmail.com, a.hindborg@kernel.org,
	acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
	boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
	gary@garyguo.net, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, lossin@kernel.org,
	mehmet.mkoseoglu@gmail.com, ojeda@kernel.org, rafael@kernel.org,
	rust-for-linux@vger.kernel.org, tamird@kernel.org,
	tmgross@umich.edu, work@onurozkan.dev
Subject: Re: [PATCH v3] rust: cpufreq: reject NULL from cpufreq_cpu_get()
Message-ID: <ar38vCqqekY7T3SZ@vireshk-B250M-D3H>
References: <CANiq72ki8M1KmxhO4vSkMUfLcuqOMvZtuTNdDpS-UcJy8rqWpA@mail.gmail.com>
 <20260929095539.1398671-1-xuyiwen14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929095539.1398671-1-xuyiwen14@gmail.com>

On 29-09-26, 11:55, spidermana wrote:
> On Mon, 28 Sep 2026 19:17:08 +0200, Miguel Ojeda wrote:
> > The From: doesn't seem to match the email of the tag, is that intended?
> 
> Oops, no, thanks for noticing! Please disregard the tag in my
> previous reply. the correct one is:
> 
> Reviewed-by: spidermana <xuyiwen14@gmail.com>

Please resend the patch with all the fixes / tags / improvements. Thanks.

-- 
viresh
