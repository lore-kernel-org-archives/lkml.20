Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59D2386555
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788617524; cv=none; b=WrI95nBIGADhunJ/qgw1fGhMXyFDkCEbXbHfxEwH1zT27S9miEeuUm/xlcpJl+jxJ/7Pk2iiZcwosjVXy3kFIeAKrjbBFGk7Ogq/L376LfbLW7Xu0Eb1IbYiDLVf/CbeCGGfWaEqVj3ofGPZlEO70AT6qU39t9AiUSzjZkB4lD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788617524; c=relaxed/simple;
	bh=CVZPkrxO4ZjxlZq4m/NTIsRuImoqLdCSbn0hsNp0bpo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=amcv9e8p624jH6oJzBMwPVXGiToruvTlfS0XlI17Mq9NIRDFnKyoYqqj4ZRHOWQ3IebpnXmyFpbGUQ6GFXT6GJkvg+Fequ0uuMf9Y000aD07su8BSMK1gYbFzHjeIlgr3gcIeGASWkcAo1haWfAveZ18EL0NO+xK0tb9u27WR28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ryTZ53Vv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ryTZ53Vv"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so18817685e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 07:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788617521; x=1789222321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wmtijk9kXljBXbjb31VQhm6h6MUm1AT3Wt8mqzADjcM=;
        b=ryTZ53VvNKbeybZRgLP9ECfQ+9bOGUl/DXVLXJxVHBk2EpvKSs3UAyV7dqz1WPN4JZ
         LGbgf/Sqwg0mH0clAUm0hHg2rad28W4Qce9B/LyKNxhRUXGCzQY8pO+240tDEt7jiKbr
         eFvf8MRZEuRifDTNkJyXU5Ji4HPiuleRJCjJWBpsIXRpLUIJMftDLs3wDv4fYEwl36lJ
         x8uaxI6dr9NFR/49tY0qhjeIlwHJgF/tTZ0e2qUQVpKgrSFx5yNfvsUFYh7JjLlRsnIH
         70CVwBQ1hUUDYBU21+6ewM3rqoS8kq7e9VOsMOikCWcg7DVy2x+xuGdKC8A8//Cj3N7I
         ctYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788617521; x=1789222321;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wmtijk9kXljBXbjb31VQhm6h6MUm1AT3Wt8mqzADjcM=;
        b=bD94He505oMGtcgOcDm2ZXfZBMrSuIHbaaIIxmXtLEQ4PhDB+koRXTsNlK7u1yLRbK
         wqG+wuxm9aXZP9V65NXcbs8Nq/IVVGl58C7+dv5ng+k6nSsFWVfBqcndw1H3KCqzktZk
         R70WbD6OQ8lwfh54maxyMEDC26JWacalwWvWwzlIVJs+V9AjylXka7lvPX1tO3AXnFjN
         /VV24wdHDSgeViXR8Fs0+fT/5zOdeOkemeO0Qa/TIaOWf3x8yCxIzB6tBbo4A6KUStrV
         JwJv6tWpnKxnjO7r5SayQ4IqVraX1YQi6crSQebNEA8DNL6lrP1esk6wEzxmjVVteZ9h
         GdnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpfTvEF+4IBE3Fdv2v9rxYHU7Ih/3mlzfzNB+Wo9RywmgCHhUYg11UpdpoFpMRmIeBm6CR99kO/tZjMNY=@vger.kernel.org
X-Gm-Message-State: AFuF++mgM5+iTx3wLUq8e6SzrZ1PszI3+kRG+Qwni8U+7/lDhppiefAX
	jYYdp99asjjrfN35GIs+rvUIhxalD9TByGe5GK1Vr/IVuykJacD2yXY2
X-Gm-Gg: AYBFou0D12CltV7aDp+6CS/ROExGbcVOXj4A1Knu36wqTckboHZy7fdlsJFzn0xpCoX
	uTiQYj/gcia3LGBviwJGtChrDCCotOLq+Ig06IdgJXJwQ8csHekGTw70tgbWfF8vUEcTf1Al56I
	ckvbMDPMrEoKMJZuNwxJbgoYrNBMsBtbm9VIp+jnjCqvIR9fM3nykBFixpqIbiBLbM11CeJr2zi
	Pwp5IgP8mZ3XvCDNNH4AFSpTeUWxM41MPoZ46yztTmUGcuLIwid/N0DC/3cpflVvOrx8ws33cWI
	nK1o9AWvTDYxAcbPliF4OnGsWyeR0IYUPDtMNMk7F6IfGcoYc7AT9EWv4cEmI0t7Os6vtzC+CBq
	6i9UpuJfppruTDBXLiL06Ep9j3T3vDNukbJQ8Al54VWnaGyGeEwBQVGEY/Me4rAUn3wVOQehJvW
	c/VIEH+/6QvMROkk77W8/Vc7F6p+vKdI6NpF7Ck34sU2Twj1NsBjPP91lG+kuhjC1L4vJIPX7JY
	06lDYNNTchHogAAYyWgc40s9Pn9i/Ddf23WCLD51inzGzjbJoPOvNWz
X-Received: by 2002:a05:600c:6748:b0:49c:fc6c:bdfa with SMTP id 5b1f17b1804b1-49cfc6cbfa2mr97421215e9.17.1788617520610;
        Sat, 05 Sep 2026 07:12:00 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm260757225e9.1.2026.09.05.07.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 07:12:00 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <5e66cd9d-845e-4f87-bf4e-d14eed4ef9c6@gmail.com>
Date: Sat, 5 Sep 2026 15:11:59 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH 2/2] checkkconfigsymbols: resolve revisions before
 resetting the tree
To: Erkan Erdem <hexvalid@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905123237.40670-1-hexvalid@gmail.com>
 <20260905123237.40670-2-hexvalid@gmail.com>
Content-Language: en-US
In-Reply-To: <20260905123237.40670-2-hexvalid@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/5/26 13:32, Erkan Erdem wrote:
> The commit comparison resets the current branch to commit_a before
> resolving commit_b. If the second revision is HEAD or the current branch
> name, it then resolves to the first revision. For example, --diff
> HEAD^..HEAD compares the parent with itself and silently misses newly
> undefined symbols. The same problem affects --commit with the current
> branch name.
> 
> Resolve and verify both revisions as commits before the first reset.
> This keeps their meaning stable throughout the comparison and rejects
> invalid endpoints before changing the working tree.
> 
> Keep lookup diagnostics separate from the resolved hashes. Use the
> resolved range for --find too, since resetting also updates ORIG_HEAD.
> 
> Fixes: b1a3f243485f ("checkkconfigsymbols.py: make it Git aware")
> Link: https://lore.kernel.org/20210901145212.478066-1-arielmarcovitch@gmail.com/
> Assisted-by: LLM
> Signed-off-by: Erkan Erdem <hexvalid@gmail.com>
> ---
> 
> An AI coding assistant found the issue, prepared the fix and changelog,
> and ran the verification below after a request to find reproducible
> functional bugs in Linux development tools.
> 
> Validation:
> - Ran the actual CLI against disposable Git repositories, comparing the
>   original script with the patched source. All 15 patched cases pass.
> - Covered HEAD-relative ranges, branch names, hashes, tags, annotated
>   tags, ambiguous branch/tag names, identical revisions, --commit,
>   --find, ORIG_HEAD and invalid or non-commit endpoints.
> - Checked HEAD, current branch, index and tracked file contents after
>   every invocation. The patched cases preserve these values, including
>   when the second revision is invalid.
> 
>  scripts/checkkconfigsymbols.py | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
> index 36c920e7..e0a1a631 100755
> --- a/scripts/checkkconfigsymbols.py
> +++ b/scripts/checkkconfigsymbols.py
> @@ -150,6 +150,13 @@ def print_undefined_symbols():
>              undefined_a = {}
>              undefined_b = {}
>  
> +        commit_a = execute(["git", "rev-parse", "--verify", commit_a + "^{commit}"],
> +                           stderr=None).strip()
> +        commit_b = execute(["git", "rev-parse", "--verify", commit_b + "^{commit}"],
> +                           stderr=None).strip()
> +        if args.diff:
> +            args.diff = commit_a + ".." + commit_b
> +
>          # get undefined items before the commit
>          reset(commit_a)
>          undefined_a, _ = check_symbols(args.ignore)
> @@ -223,10 +230,10 @@ def red(string):
>      return "\033[31m%s\033[0m" % string if COLOR else string
>  
>  
> -def execute(cmd):
> +def execute(cmd, stderr=subprocess.STDOUT):
>      """Execute %cmd and return stdout.  Exit in case of error."""
>      try:
> -        stdout = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=False)
> +        stdout = subprocess.check_output(cmd, stderr=stderr, shell=False)
>          stdout = stdout.decode(errors='replace')
>      except subprocess.CalledProcessError as fail:
>          exit(fail)

This patch is unrelated to your patch 1/2, so they should be sent
separately.

Sets of patches are intended for changes that depend on each other, or
at least are closely related.

- Julian Braha
