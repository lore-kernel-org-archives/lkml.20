Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A03C4A1DED
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373156; cv=pass; b=Jd8G+bD/gP1Ua6CcRkwboGcRYshnRiJEI3wOMKHPcEISls+sqeNA1ziS+xYo8JBVhKJvrWIT8W0DvBOg95iqrvn8ZWFAjn/wahhuhsXK0E0j6y+yvvzURy0DZ7P+EQAsRxtKSNqGk+kPPIK5lZXs9VqzClH2dDj5MOHLSLsCfis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373156; c=relaxed/simple;
	bh=x3BovMqKPyOzodOG6cYU5vpG492YG/WZZeesFshGEqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=csRdiS/OV8TCADRLqYPeWGDLq/BF53NjXMVDhOqopbtSxq/RbIh+dPk8mE7OTOUABASjwgDpbpfbR7V1h8JCeh5UF/a5rrDct5spyUWXiO/5y9EDJtO5dHO/7fO+62wEagI3nCK4I9l9OBsYnTG89kyCsHeA/3On8x65VGGFmkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MEZP69ez; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MEZP69ez"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so5843e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:38:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791373124; cv=none;
        d=google.com; s=arc-20260327;
        b=RQFlIf5v0NCUIXosBHC5lUggCWR6GV0fJblWs10nuxIxzG+vPgvDaTjEtO/eBgEIKM
         v/y2xPWkYI21iatuYxVbS6i4yx7+hvjz45NcYoO31Wzc6Cd7i7A6qA4rchx0mwQ2z9ze
         JJQ6iTTmDlMUK5LJ1ezbHECpKZu8+29keesB5iirQLCErDuNwp+BOZuFNpGUYOqjNNmc
         YCYwNUWxV550C5IrJu034/uedv1NZvTPtOSBV+ErKtNfv57r+ygzU994D8316pSJ3h8C
         bzCZvv2YWWSq4DMNAj684Ddu8wnimll9gd6E7epDCx/m6NiiaW4zTxt0H5fXkGdG2MSg
         A/VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x3BovMqKPyOzodOG6cYU5vpG492YG/WZZeesFshGEqQ=;
        fh=ACLZOUxLVJrFQGgCISVrgjiJmfNrWdUZdtgHdHWvNRM=;
        b=Vy1cp80+gKDBhywjLGWql2Xg4qukAUfoEZ8NEYQGewlCF6BbEWIbrKNft5bEol3Ggf
         LHw5zmufZp+5u2qZ9R0fgdEcNzp596Jq72Ap2ZpsOeSu+rrdOFgc5vpDyCkubCBHnyaR
         IgirW8xWmgbrQOujXpwFRZqBTWa4kj+Dwm9vR/GZnq8jR0H/gh5iFO7SbCOgX/XzBR9d
         J59zUQkkRPWMuAUfz67tiz5A0Lt/Pdk5gN1ENPcJiyTms3qmwHyiTCf0wFEoWWPqXIQk
         vvfnexxJ+BmguAxevc/w0wyCmZgKiyX8/9JPhw5y50xMidqUX3H7wxW4J46vyh/f4Sqm
         4pig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791373124; x=1791977924; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3BovMqKPyOzodOG6cYU5vpG492YG/WZZeesFshGEqQ=;
        b=MEZP69ez2h6cMP8KVq+rwlyqfNMmHJTjAavsHtqjjy4k/nQn1muG1v1HOYvTK8y8pe
         OCR3gyq9Wpx+iuWjntOv7nIBQQaRnY+boMSyA5XyvXE8fKDriOFdBfgU2AStu3VXqFED
         /dgzzAQ/YY5Cfta5/scySW4ylbZX++Oq5uRX3n2/adqph6ZtWX5rQmzdKk/VRlpjqKn7
         gTx6OVb9cqxxWHDsy5zOg4/6Bn3c4NrNiIp6n0Pzn/4q8SGMV2nd9Pwem5t+1uO0kd27
         bWMlsd37YQjzUQs60/tN5Lz7OXUC+uUCVHueBXzcIEMqODmaqIEWDkNsvrwNtlYlK3ID
         +G3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373124; x=1791977924;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x3BovMqKPyOzodOG6cYU5vpG492YG/WZZeesFshGEqQ=;
        b=hGC6YeyO3bczf8KMHu2wHlvr64HkDRiM9P2MzmVfAFbBKqhz7t2XJrEZJx9colQ9JP
         frqJv47HPZP2DOt12nWPj/RGCbks9bqKrdvfSKXF0cON+C9J3tPx/Ak71DSusVmlTcEl
         suQzDODvIxllzpDWdCLQgLEG+86SzY9uc+fSHbXC5xbL0Rb+CFuaRX0qBwF3cEBbG82d
         aGYsHfSMe9rn+B4UGtUVoEyBZz6ULhZbD5MR3gtATWjKd+hqzp7MbGoQlveJQemfIM3E
         GDbRHlmKLcHvuGmccL9fW5yGqJT1MDzuK6V3ttpkwBhyYZbDwRgrEIgwO4ya1ChENzOo
         0jKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxN2U7zii8euIt3ZHNNtByu2I9cT5SFP/mmiNmleOXfAI9DwizQ4ybn/alwERb98CdDpIP15+J4vcg9hhQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSbhyedfhJLaNcy7/7aZYCvmYmrwm7xtly671aX+RHlRkwtvVG
	R7fvbTs+AcyCqWcy0vI6ozlHqfhH4JgSxl5R/nXevyYS5BP8e2Dmip7DPPLEgAmBaS9WPjmSdZZ
	qET5ssbyDJLdAA50u7+u5xaO4AINxQlQvDHZXRR16
X-Gm-Gg: AYBFou0SlKRWaPkxPWBZXFtJWf63+9xuHaJj8NqQ/ITthYkl/Llj/ZmzMJenl6CBfSA
	fWHPXi0WZj7Q4KPxoC2a126OfbvgVK4Gdj7N6nLG1KCO7W43CLjkFTm+qcr5DqMr8b73n/Yv2uS
	Ja+/qOkWiWigV9jlMqFSAIStYwIq7/ahUa135lxcmxo5oOSVLIs3WbUKoVewHzccAyk3OidoIwO
	uxkhroY8X/pux8b94wsgP1yXD6U1FLblB2jtx6QKlBqBTMzF25yCQOx9cNPr26JzFFGfFBlQi7Y
	I3WCxKDiA9+vFimN3JZ/9Trea68ReVg+NI5uv0xKUKK/gcL+6RlmLW1B0XqSFeLz
X-Received: by 2002:a05:6512:3f0d:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5bcca857470mr322236e87.8.1791373123590; Wed, 07 Oct 2026
 04:38:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-11-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-11-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Oct 2026 13:38:06 +0200
X-Gm-Features: AclHuK-THf1WIqt3xPRpWJs1Q81-pzVnFszT4A1vRUwtheoFlxrVY7-HpfrRH5U
Message-ID: <CA+EHjTx=CoD5vUN7X6VcuoLeoqXeF_h_JVuhiwaHLBqNraZg8A@mail.gmail.com>
Subject: Re: [PATCH v23 10/14] KVM: arm64: Add VM specific callback for S2 MMU operations
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Oct 2026 at 09:36, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> Add VM type specific S2 MMU operation backends which can be initialized per
> VM flavor, to keep the handling cleaner.
>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
