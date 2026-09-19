Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDA63C1A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 17:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789838983; cv=none; b=dqs/N2Ydqvj4hgiZY5YlOPbRKDc2PakN5NSUGvwjVVUg3129t28cuB5lBinVoAmKX4xAL37LkJvoBfQ3LIxly8zWjWUeU/59W0T+BcFyQeON/018ad8iQG98vN70T6AlPIPW4wds3xZsE3QCIzqIzVgfbAtFhzBcXuflwQu50NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789838983; c=relaxed/simple;
	bh=1Ki9C6mAWRVdae26yCLibISA71e16pqnZJrWLrieoCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZBEnA1U4cXfHl+Ez5r9qTThm+jhEro+FcO+0Kzxe72SV2+/7CLf0eb+MvUjaaCTymEBrzVX7eo8Ry7VQzR0ntzA6Mn6jTmN0n824zNtaRKNo0miPnbOaDXABy0wZvlBPUEMTBRm6FcCIq2PKH6/cOYOaBCvBm5wwMy+/q9zXFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vk+YDu0k; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vk+YDu0k"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c2790ccso996025f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789838981; x=1790443781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zb85H3roC11tvL8o3j7C8yjYyZSpfYfsAk3d3AVzVaA=;
        b=Vk+YDu0kIAEHEcSXp3Mt+10fPSxEQCUbwU0IeR8HoBXXVwugI4rNb3YiKLhvoJ+4Wk
         8Mp0aHEW0qQzfg+QGP0DdTIM0zuhgZVhP5CfnLYTZ9m+EdBih8oKumkuLOOxXvMQuyQi
         y/rEUIUJI7UerzTTTIrWp/wjRJRbex3MjDt2zyvCiYtH9w4Uvsr0uaZEqGUinQhRdWzq
         2WLNKrq5GpxD22zqyQ36neP6jHdsig61ZFeYIhUMCZgECOR9C29+9CM1Q6kASvvpIbXN
         gXBaEf9M+Jb028mpe4HoLaf/d3Mm/WvsOyEdNZYtFPIfUNAHoaHacbUkg1GxHoQuCFai
         eBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789838981; x=1790443781;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zb85H3roC11tvL8o3j7C8yjYyZSpfYfsAk3d3AVzVaA=;
        b=QiCIJN5vAzgYLou1ZdPGQnXEIi2/Ytb0QjPw/NQOa7Igwi5b8oQmWP32k25q9qSScv
         ZSIkZKkjusAn3kQPJIgqAsnjltHBkc4jx+YEn4ZiGFyCGfg5HVDEn8/G6RdtGTQFf/Jl
         bzwKY3+7QJ6vXHsOs5XqQopOezbvCqUcfKa/cZob3QXL871XaKiWcGvitUuwBoyfeXt8
         8z+7/O7WKa0sRrs7UyA4ERlrhG/qwnpvumHT/Uyluv5Z/Ogqgzytn+MsdHeKqKqzW6iS
         qX/IAlb5I5qalYFtcR2eXt5Z+ric4684UvPfCSpaFiuZJvIqb7X9N2CZAfaTVvfFqtZm
         odfg==
X-Forwarded-Encrypted: i=1; AKwUvBwbznHGwMiM/9l8GN1SZWleKnKMJMhdZXLDRmY4chj2icm+jMBXt2di3klu+EQ1ASA0WDRTUMLYAqwJ+Fo=@vger.kernel.org
X-Gm-Message-State: AFuF++l8Sa4ripcCbUcuNUIOHMXRBJv3B97F7223Nf0+8dWbY1yN8uGh
	hZpsxXR7C+4EavFewlh12bNDrEQ+0aAijL2U3Wa+s3jDrbCD2pO4FQTy
X-Gm-Gg: AYBFou3UijGZUQj52agHo6PN6Il1TOuhrueiDK0ccQjcAcDIW1N3m8fjqLO7Y0ab6/c
	CBRXf0bRNLL/MZj5mdyDDa/r/BC2KVeA80YBHpZ1e7gKWxr8mKtzJDk9f+8zBpho+8H6XHNI3Ki
	2amTB2o07LmVD1bE1kSZkw8DkqDiJWMIzstdZShuIEoogzPikx94Z3qodyxijB4afBN7zlJ51m0
	+h50qWBtXicKHWOLpRqkZ23KxPybNnqM3zPlWpK7OvaVrPfkIJoh+RBvtwC8le3eLLBvtFx82W7
	uMz/q0/pVBZUVOjlpnFKotAGxhfxkieWJZBEksWRgcNlA/GfhEujXU2swHllf93P+WaxyBqfsRq
	58lzbcUesMgT112VyeiejUoPkQqPbljgqXWy3nLoi1Eh+sDssnpd14CEqPgkHlaO3FZXrfj3nY+
	mQmK1PQE6yVSbIKE6HhRuEGsgpY34nvBo/RLiuTkvCKwW4YCAP/JkNa6g8A9z8dSod8gKGVMGE4
	8+XijpxmZ7N4wlsXr8kb6x31Hbw9yP4sTacEry1xgogM5WgbgUWiSJ9ddRYdHBHu5s=
X-Received: by 2002:a05:6000:70c:b0:487:27f6:a4e5 with SMTP id ffacd0b85a97d-48727f6a69amr2301070f8f.53.1789838980398;
        Sat, 19 Sep 2026 10:29:40 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm8904299f8f.14.2026.09.19.10.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 10:29:40 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <a1efc002-c34b-43a4-be02-ff4746d13241@gmail.com>
Date: Sat, 19 Sep 2026 18:29:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] kconfig: tests: Reset KCONFIG_WARN_CHANGED_INPUT by
 default
To: Nicolas Schier <n.schier@fritz.com>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>, Ulf Magnusson <ulfalizer@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917-kconfig-tests-minor-updates-v1-0-286e5c985244@fritz.com>
 <20260917-kconfig-tests-minor-updates-v1-1-286e5c985244@fritz.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260917-kconfig-tests-minor-updates-v1-1-286e5c985244@fritz.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/17/26 14:38, Nicolas Schier wrote:
> Reset KCONFIG_WARN_CHANGED_INPUT by default for all kconfig tests but
> those which set it explicitly.
> 
> This fixes the 'warn_changed_input' test on systems with
> KCONFIG_WARN_CHANGED_INPUT=1 and ensures a cleaner test environment.
> 
> Fixes: 645323a7f4e5 ("kconfig: add optional warnings for changed input values")
> Signed-off-by: Nicolas Schier <n.schier@fritz.com>
> ---
>  scripts/kconfig/tests/conftest.py | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/scripts/kconfig/tests/conftest.py b/scripts/kconfig/tests/conftest.py
> index 66f95e4ed58c..e92f0cf1421a 100644
> --- a/scripts/kconfig/tests/conftest.py
> +++ b/scripts/kconfig/tests/conftest.py
> @@ -34,6 +34,9 @@ class Conf:
>          """
>          # the directory of the test being run
>          self._test_dir = os.path.dirname(str(request.fspath))
> +        self.default_env = {
> +            "KCONFIG_WARN_CHANGED_INPUT": "",
> +        }
>  
>      # runners
>      def _run_conf(self, mode, dot_config=None, out_file='.config',
> @@ -57,6 +60,11 @@ class Conf:
>          # Override 'srctree' environment to make the test as the top directory
>          extra_env['srctree'] = self._test_dir
>  
> +        # Set default environment variables, if not set by caller
> +        for var in self.default_env:
> +            if not var in extra_env:
> +                extra_env[var] = self.default_env[var]

Maybe it makes more sense to have the tests ignore users' env vars if
they would cause tests to fail? For example, this recent patch
explicitly unsets the KCONFIG_WERROR flag:
https://lore.kernel.org/linux-kbuild/4d1eee3a-a5f9-467e-880e-4f2815851b09@gmail.com/T/#m25be9ad4d5e62956c5f98759398f91a555afb4df

- Julian Braha
