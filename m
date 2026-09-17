Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E48C4ABBB0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789660156; cv=pass; b=Xk3TmXQ/ufb1mWoIRN+gSzYzyTquRkKTRcpnlcTqWb1OVo04k3KAm3RFosX2+v2jFazR8NcE1h25Mn8lH2IPZVfh8jqAyhAb+Dpjm5KBPwIPgAdquVEEb/xufsT2lOVkVo57Vml3omzuuPA3E8Q4i8MNxEEmolEa73iVH/zoh8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789660156; c=relaxed/simple;
	bh=MkUdFfNPXdgajb+rcjncmrSL91PHLhj9SCk6H1w5YvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0FdVf124s7TVZYponFyfxFBhwTQKoBq0v+agrcJdOS+pDWRNfOdVNmYNKa1fGhYRUdr6W8RcWXsn6HHgh7oPl6h31C6ueW+vJJy7/b3UnHs/oGPVYrqeOzKen3puy72fgk5eC7PxgHjdP6Sv/xq5jW4PluvEB6B2uhqGthxRuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MA2vp1+8; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MA2vp1+8"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcc3e14so2797466d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789660149; cv=none;
        d=google.com; s=arc-20260327;
        b=YXsxuIKItexIxMmtKL6xQ52dnVlAySqWVNa7EL8UYtPqXFGwOxA+YNpXXyfqriEF+L
         /z3Z2wXJ8/ULISPvprZ6a8Hf5wIJ9OadRqgURXTX3uWVfGI0ZxQ7zmt5Vu0/oUX9iLg1
         F6D+6oDJmTfTkBVBXg5Df+242pBuTW8PaDj/7Zkhv0r7FZKjsgzrWALLSSePkJvCPGia
         si8c0Cx0CAVvbzPXZAH8rVN/jpKWgQINTHEA4L5CUxP8xrPZzww0etWYkm42U3I1pd5T
         egkZ7/eqxKMl+XpAytCIi4nAQTXwCayYU4YcvVoEzFP7oM3Cbq9edaCLfxFFrqpKnBcQ
         zcFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kVbNW9nYkTQQZyk8jzXTmmCW1z4fY6Sef5CqQ+fiU28=;
        fh=F6DKXt7YsM8IO5warbF2rIR1WFC/9JnZ5GSF1RqMRVg=;
        b=sWDc0eBq6hohmxupt+WDNNlD+sv7aG/G0Acaswy/RX+qf8aUCXgQESa5BiOzMGK2v2
         WU/3hfDSr7VeDmJd13fXNoY0qWymaufu7YxTT0XpXV88lbelbeWUiBRgLOi4nGyQtD1s
         yux9EFU2O0Rha1Wh/qpQ67I9FpIhTY/VdBD3n5CWDLnquz4zLFG/vO389BXBtYra7O90
         QpwIUJczkC1GyqVjzESF4M7wlAJEf5GmlVly7b6jTiDZotbB4j0sZ6lsJBann5ZXlVU1
         Tca9q3RvjO/WkGuKIRQ0C9UJA03wyPmA5HxUeiXcej9KGOKW+BBsCcI7idWHNiFSzwgp
         lh7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789660149; x=1790264949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kVbNW9nYkTQQZyk8jzXTmmCW1z4fY6Sef5CqQ+fiU28=;
        b=MA2vp1+8yYNltTbn6zmtae12ab7v0FU1gDQheiNI7X+p5NuJ9Vy8c68YxZ0AhxQ/nc
         cwnjAnon59gRZ1F6jb300vi4pIp3DP1Mnag3pEwdbvcf9Ijw5K9Vwwo3/Uvo+mLlCufX
         tXqOdxk5eHd071gDKOGNQZCpjUMY1a15knlZbbBzLYmrqRzf61fJkkEvPOJ4V6j6rDPg
         5GyNtMtPYND/OPtAaSwvQZk28IL70ksMoWIjdzD6nzQx0bqbUyM3iXfTPFg+txir4UU6
         JtclYKMREtiL4IWNJ4EyQ2lpexnZn7P/vjU6KAL9t7dG6OLTqrXwX0Ow+7qULj/0cc7S
         TDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789660149; x=1790264949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVbNW9nYkTQQZyk8jzXTmmCW1z4fY6Sef5CqQ+fiU28=;
        b=Ym4YRdzttyOqkflLlVnaXrFjB1WS+z7vUYjlE8PHNJCwuqv5DzLcA+RCUmAh/c0lx1
         Yn3IbMBfugjEDh48PsYsaqkWp73Oo4dYIhzYYOo4YmYh5lcQKnXfViYBMrrubveskrNS
         bMG4i3XrmiHbyOiHi7XYPDHpEf7KsGYy/6+UXvQ8xQ2Bf/L+SUYSGU6IYm9yOFdCeBoz
         fQRqKaV3H5FYM+CKcwR1iGwuFfL20WzoTqZChBPymajP2TdQhgPSWevDTEJZ4kBe/AAu
         XeaAp9SU+URUd5usVlIi2Uo8VLZCVySfOIe6dZWLUXKMyxa+K4dtvWr/83Z9IlqVpRPX
         BTlA==
X-Forwarded-Encrypted: i=1; AKwUvBx0dCJz5ZUwE6aQlN83KD5C/8p8NC7NPn7fsBRbJsBIkOKtoPd3B7LZnVZpYZSLtXreHcXKdMhj+xr45lg=@vger.kernel.org
X-Gm-Message-State: AFuF++nFYxJNauv+1V5on1agEcqXu6G5pfl1jY2Tcdu/anvvvc4iQcWv
	bECOVBX5Dd8y3m5oExUgTJ9ESGlkMH0QCWAv1kzj3NiJ6sN41Zr0T30RIC7Rm7O6BshxLOtGzPs
	4XKK64CVIaAJz9+S1qQ8+IgNuOYSdBdo=
X-Gm-Gg: AYBFou26xbRvGHefBgluQyeR1ZEzYp7tcsoq3mz2aic83C051v03thWR2GFkWsxOuEm
	NrfQygU1RhRHVOGxDjWKfaAe552Q5K/fxaAPhLBIT74C3qZUjD0BMAJLupPjJqRR+S2YbiM+lBc
	hZ5rQrG9GrcUw0jhxVoWtrRFRG9ecAuMofaeH/f/IdMoUa5OzvWDl9jDXMN2Du7KahglaVO2EnM
	e85K8o0xSYyXEg/dW9f8+hlszLHdXnHGXBLcZ2QdgKcPEbIdgJ6WUjAuxTkKxZs8yzLK6xaOw0s
	vuIb1hG4ITzHNKrMJAjlExJ4VDzu/GWyQgrdc1TODMya0Q0mi3De1D/xGn6bBfJyCAOCLRmAiSL
	6PgqQScW8+kZAhCN1hwJV7ZsyA9g9kzCmumI5fVyPpZLcjXOUtKFcwPOpJt6sex5hc3nb
X-Received: by 2002:a05:6214:23c9:b0:912:517a:7242 with SMTP id
 6a1803df08f44-912524291b6mr8701086d6.21.1789660148526; Thu, 17 Sep 2026
 08:49:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916134637.216062-1-lucasadramalho@gmail.com>
In-Reply-To: <20260916134637.216062-1-lucasadramalho@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 17 Sep 2026 12:48:55 -0300
X-Gm-Features: AcwNN1VzBv9agm3gNTB8NdYr1TpRSTGqcm9esYX-ZHEuTBXEwsWrey6DNjYUI_Q
Message-ID: <CAMAsx6c5-s4kiw7C-F0tt7jZ3Bu4BBHoPmtuhoRK1-K0Gtcq8w@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: translate maintainer-devicetree.rst
To: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 16 de set. de 2026 =C3=A0s 10:47, Lucas Adryell Ramalho
<lucasadramalho@gmail.com> escreveu:
>
> Translate maintainer-devicetree.rst to brazilian portuguese.
>
> Assisted-by: LLM
> Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
> ---
>  .../translations/pt_BR/process/index.rst      |  1 +
>  .../pt_BR/process/maintainer-devicetree.rst   | 76 +++++++++++++++++++
>  2 files changed, 77 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/maintainer-d=
evicetree.rst
>
Hi Lucas,

Thanks for the patch. I checked the translation against the original and
it matches one to one, and it builds clean with
SPHINXDIRS=3Dtranslations/pt_BR. One note for later, not an objection to
this patch: pt_BR lists the maintainer handbooks explicitly in
process/index.rst while upstream reaches them through the
maintainers-profile-toc directive, which still points at the English
files; your patch follows the convention already in use for netdev, soc
and kvm-x86, and I will sort that inconsistency out separately.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
