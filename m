Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637162;
	b=ZMnZAkT13Uic01npZtWM44IbvbsgbAxVj0kbl3uEvBRvuvUW9uGgXCapY96ACcDC97Ac
	 OGJa3WHBHUocV2pjicve2BM+PF0fPb6HfIk6rpO2rxx4uDMQRT9jnO2k4f+A1Eshvdo4M
	 OKHO6fiYuSolf0kEbkI0SzFkdPM1Ako4qY6xRlQwSSHNNXaAMGzNjxe22SS7GAGQyFYsb
	 IH517zicvjDMaleCynePwz8kGontSn8xlqmYae8y44eJ3G35+iXsxdN7CKTdOBj3L7SMh
	 yKNYDOA4RbcFe+qtgfm7L56uzjIlk5KoE/WnbYXeVFmJzwqQolb86hQQgvAvXoZtAYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wb4mBzyfZ0kKUChcn64LcBZNg4proTG3oaURoFMVm9o=;
	b=DlrbRO5mSEMHetpgEe38yxMz2w83avzeh8EhUaNgkaeUTeg8MkoNX87ffDcEsXz7F38e
	 hiFVHuSYMVXyJrGxE2ZH1kcZGzZL7QwPoYTn+/vBVVEpRALQK/w6UzVsAXjI3d3fSX2ia
	 0hqd5bb51+Zrfcfu1sN+9Z8jJv2Hh4J9cgPtLUCkA/xvr9WFp4pOgTne2n1JfbrXivR6x
	 WPeM1K6zhPg8tP8txz2Mub0Y8NZpC/np5DmVDeHPHiafJEXrZImRiC1mQXuYnlLg/CznE
	 77hgcxTKwSDJZbYsWE7woTGNGYWwr6i83xplfj7+Q1Gq5/QXTXWYXprnW+PkC4mKjBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFA8608A34F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AFA8608A34F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-85c1135c286so2080143a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793637150; x=1794241950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wb4mBzyfZ0kKUChcn64LcBZNg4proTG3oaURoFMVm9o=;
        b=K7dM6d50zwoz7aBhfl+TN8bK1XqD7HIB6KXzJnB6Ev2K7k6UMTITkbg/ivKc+8K2at
         TSljeWav5xZoG4upTbnADlaxFwv3+NlnzDGoelfQvT2EyAjf34EMwTBQhp5rFgxcGHz8
         bE2G0wwNppAlW6XH8B4OtcffWhAaq4xQphf5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793637150; x=1794241950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wb4mBzyfZ0kKUChcn64LcBZNg4proTG3oaURoFMVm9o=;
        b=E/PsF3hYNrDMMnJ8VPHvlRy6ypYNVqJw8WivSHV6eJoO/W1ViQssvwkdMyS11huhln
         aQuvWtqHN/7T5YxUnA+N3sUJkC6kR8uJfE1vrjxbk1qaDO8knOo6oby9NLwHcmImLfmD
         wSzu+uCigTV/tZTiyCJ6l3ezewi664STjHloAVvKyBAG3vz7fEoRgw+4s6+jzpPSESm8
         mlq/H0JpuaTYUKEyHrNX91ZxUMs/uNpfExbFOj2QKlH+3Oi+t1mtXRiypK04m8JXB7DE
         zReMEOjnJLOA9wCeWi5CM2jQ0VsVBFRtS1CSS0TBPAVjYRhIOyD60e0Ub5lkxfeB7nl2
         4boQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLgW5AaQdKbv9iAgzoIvMeJCN6s/B59zWeDxszkQW02XrKAa0a4FzvH5I1ynEN7wxZ8SLYtZmsXpXVm78=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXSqBKM872RIU3bmvEdOsJ4hkTgH2xft1JayoDI2wvBJy0D9tc
	F8GmdLK0A7i+8GnCy70jWjsw9NveLOIBU71nz7Trj0tEN/PTwAhc4/+oZMb6CHEAqVI=
X-Gm-Gg: AYBFou05tIt2qpnlGKv1bd/T4SFyREkjtFw9/Sy3wiCfzvILTQ6PKRpKmWFPubUt7/C
	9qvdQQvRKZ6hAaDJP4RdlsUFYr0Y8UU+mDwCIpW4bgkqYMq81Cj62KabcH5hn/S8XlqmAZVis/L
	AKyHO1rdKptoNtDKL77ZIMNt7mgKeJr8ag1+ybsFc3E5zjJyBOp5FAw2QtDHbKLxWznGB3dEVgV
	EETu3LNsaKPYfxsVpVsegPJqyAL/NoMEm5oO4/XG3KRYy/4tNV61TOrU2a7rYWddOPcqwcH13m9
	NAyORmEe0Y8tUHUfQ4YpQ5Tf/vXtF6HzvKFQXeqSj51+zwgawyBf3AOLrl3zVAl0w6jmFXyFxF0
	aNfisnmU0xo/brN+/hzJm5QtsAUHnLdqPV3LJJEQd+AMUArEkoPq26nJVM+C9FTUEBp435kDZxO
	Nz9vKzUsoL435gZueaxwDpViBmJTauR9uKdmzQFYR2DO5ONfueUOxlCTqcLTa+ErcnqCrP2uaMT
	X7w4yMONOQFABJ6CIbvOfnkxyRJGK7p3xXMqiUq7aYX/toiKMxoQvoqrNOB68XmIYiLkpemn/Vp
	R1KTebcwP1bnAT41zqCTNmn42qhcS5usTElE
X-Received: by 2002:a05:6830:7197:b0:822:27d6:c28a with SMTP id 46e09a7af769-85d362f2e48mr7714233a34.4.1793637149826;
        Mon, 02 Nov 2026 08:32:29 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d351e841fsm10329751a34.1.2026.11.02.08.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:32:28 -0800 (PST)
Message-ID: <97e486d7-b5e0-4293-8bce-75251f5d3c20@linuxfoundation.org>
Date: Mon, 2 Nov 2026 09:32:24 -0700
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
Subject: Re:
To: Regen Yang <regentropfen.yang@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <CAJze65gQg=q2OW-1n5wT6vah8FnjxD9rsPCsyg4HspOB42o53g@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAJze65gQg=q2OW-1n5wT6vah8FnjxD9rsPCsyg4HspOB42o53g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/26 12:20, Regen Yang wrote:
> run_kselftest.sh sources runner.sh under /bin/sh, but run_in_netns()
> uses Bash's &> redirection for running a test and deleting its namespace.
> With dash, this backgrounds the command and performs a separate
> redirection-only command. Consequently, rc captures the successful
> redirection instead of the test status, and namespace cleanup can race
> with test execution.
> 
> A failing test run with run_kselftest.sh -n can therefore be counted as a
> pass and return success. The totals can also appear before the test
> result, and skipped and expected-failure tests are counted as passes.
> 
> Use portable stdout and stderr redirections so the runner waits for the
> test and namespace cleanup, preserves the test status, and reads the log
> after the test has finished.

Please send a proper patch with patch summary? Add output before and
after to the commit log.

thanks,
-- Shuah
