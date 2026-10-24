Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829819;
	b=NtduZfm8P8Lojg/6KyUIjPN5dR2YwoRNEk8qPKb/72iynlgUOWavembjhHEJraH+7YyL
	 NOr+ZQ1Lw48S119cXUa1PhYna9eQu/4CivVQ/0yOqMFHT8GfxUT5wzvf33SKjccGzo447
	 G/q/UIL80ZZXjhVN9PO5OWDf6yCACc1CXF966wGvuICFg/BwYkvBKhtuDxlYT7c6BCA6+
	 v3VYxt1sUunOb/8yIf9VVgDGOMxUVaUfpQahk3jpU+dold+R5bEmMgiaQd5GZkROOOxYL
	 upaiLqJtvRmLpNHvsInl3T2WKqW39Vp+lwt0KDg/fQFNBkOP/ksu54vQHI9fFU1lxKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=;
	b=NcLGcWBPcouignszTx+mVn5D76etgM77zlgBMpLuFzXJnxv6W1x60Gz+9MEbgg703j0G
	 vWcmjGixFSP0ShLN7KzMf6wLFJ3acy10jk3ipX3AuKB7PLebBFH4d1sIC/psMjNn5qx69
	 zEILwGLKQkMdpsa6h5otLte5IDUl4miP8C+4AMpL/VNttNZ7X/yi/KFTP1t4uUXi3ljwY
	 BqicAOJ/QDA2YvPnI/RkomlW5mppqyHGnAGLUYGhv88wOWQWTytgcA1n8vPivhYrS1JUe
	 yX7wv02vxK27TdMTC4R/0Ugm+GQQDTFcLGHCv5/mlKnhw0k8BFYq7gAWY0dKQbNAb/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="j9m/eYvc";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1D1606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E1D1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=j9m/eYvc
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so2250600a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829817; cv=none;
        d=google.com; s=arc-20260327;
        b=neWhpnDpJRFU9tE0Nw0fF91sspVbCKT/3T/HZ0bQQnapURitgu8cXhXe3H6nmJLDDX
         TmDxUC5ZvUmJGTiWkP/mq3a0Zsz2pKD3YnEuqGUjz4WFR4DGzpjMJ50VLlBA+UFDACkQ
         fCKvRgjIe402+V2R3na1OmiP4nmYHhTKirYYb+Zs0bhCK5dWlMTV3uSwNg5wiSTAOZnB
         OguuI9NYfo8hXNJ3761b8YJgZbqEMNc4n1hpbYAhihHvq4H9DHj6MRmEUuC++6qX8BOi
         Sv9R+9Ag3lW6Cji37b8YzfSBP5yxverb5JsqVKOAjK/YxjH/iQhDQH0E8wWjAioqP3d1
         W4Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=;
        fh=w5JXjcxpBJzaxX4vcYWq7OZ9M52c1IUibp+emftELQA=;
        b=m4bM0leyBZKKE1lfoT0ETo5syNNM744WrG/vkJZceTFUx+lgZvliLIbiqWHf81SEj8
         BH0ZQqE3ccUGjH3VsPx1tlK2GSVw5risjSrdVt0WghiwaQuIIMjJif5jJ9Zm126+TPes
         Lto5IpOCoU9MFP/Qrl/T+j8j79CY6vwnGEfQtwJ7+1oQSEmCdd+u3J1z1ZJX62NQjEbk
         jwskuUVIU52tdgGdUKGjv0k3UIONVVT5ZkqG2HtHz3J1AbrVNWRUDs2iNlrsEZhK+KdI
         gGNqGPxTO7vG4s2+SduzvLIrIMT8Ae/CoHwuhGtQOL5cuChxZ4U5IOfo/WwrTeq5U56Z
         zrjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829817; x=1793434617; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=;
        b=j9m/eYvcshaqWdxR1RRPRIr1ItYrA1TN4RRH0Tb/73JTmjyGNBA+MSabq/chQ3jRup
         FDO+bPo7UmRdMpdeNPL45rZL+MvdTWsOwUsOK1L3CWBxyBfvgHY1GMnC7+rnUD+uEALq
         OMq+yCYuInNRftXgM4Yo1DFyaRmVERqAUmQ+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829817; x=1793434617;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=;
        b=v36fzrUNu7GSr2Tl6aguLNVNBhqjjGI9aBBfxJ59wCNF+rTHOKdp3zXSNJX5oHZSzP
         8QyzkJguH8zV+Tu04RSMNnmGWBf81ccEDY+tsWCz2ZWk8G115yNqsFqVnzkd+5TVzsbp
         Z+rZWXo9exI0KLTkGf0eTF7QIa3wKVgHXu6I71wCKbxRevNgdlsmZHTxnNZtLZQ1iPPQ
         4ZxSO0aHxI7f8WpKG8JhN0JYUHKLi2Gi08iR8308B0Khtg0SsGF5a1sf/qcD/Q2aYLW2
         F/kOZey7uMuQD7S7HpsVx+5bjW8h76LiTZ3FmMSSsVEU1yIdZB9YzALTGFDtN1yVLujc
         D2gg==
X-Forwarded-Encrypted: i=1; AKwUvByOYTZjkKs3yXv+3uQgKC7rSNRdQ8Dgj5a5f99Xykwgc7KGaihViutBhHVI0BBsJLM93A1UoPIw0IuVuiU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaujIijEt18qx4zwlgNyVRXqDA12Ot7NXpVK1ZvSwZFxwRnxZo
	Km7GhxKaEQcMRKlvYAuw+vMN7G/xr+ARUOXEOX3isRpRphn9gR9kzBC+jAXGM3ZYcv4C6G12azx
	bDoYk8cMjZVYREtQzxGXdYyTytQAfZ/bu6um/MM2Y
X-Gm-Gg: AYBFou1J0b70rCdikrSO0Q4X1NJA4s4hgFB5Kcl4stKZsYIgpJfsiBZBYLx6F5pcCkj
	LGuuAw9JPaepUzRDK4tOtj8vxVShexU/WEsAfXQs+hLHFJZbxxNfq+3lniaW+nSuhOF0kc7BQ3W
	SxHyQAKlPusfcB07OyBwcdjOvOLHBKTpzsvlBncztdmDMkuq0W93a7plFGAydPPc5ztZzZaFqqo
	lKwZxiG19qs5ooWHY1dsHNb3qefs9dEiLNzNwkkJhK7hzTdw9WB91lh1dOeuPca3OURCbNBEAm3
	1e/YDRGx9ijustv34MfHWlWKfX8B87nAajoMbBMZakoezxYkIzc+HC5qPQhuActft1PbGYpfi2l
	vjGGvXCLAit92JUFPqCaxjasTpcc9jq5hejQ=
X-Received: by 2002:aa7:c9d4:0:b0:6b1:c355:c7c0 with SMTP id
 4fb4d7f45d1cf-6b442fde26emr1152906a12.26.1792829816963; Sat, 24 Oct 2026
 01:16:56 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:16:55 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 00:46:28 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.1.I7ef2211f59d5912146a6816d533638605edd0f36@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.1.I7ef2211f59d5912146a6816d533638605edd0f36@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:16:55 -0700
X-Gm-Features: AclHuK-X20URHOUw51jVSQxB-TyQaLgWVXdt5sH3O8YNafmV3nonazmm4bHkTWI
Message-ID: <CAFLszTjoZ=TZqW8BTFTot0ZRcv_--BYZgdOCUD-rv6nT479--Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/7] scripts/dtc: Add fdtget.c and fdtput.c to sync script
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> scripts/dtc: Add fdtget.c and fdtput.c to sync script
>
> fdtget.c and fdtput.c were imported into scripts/dtc/ in commit
> cd296721a964 ("dtc: import latest upstream dtc") prior to the creation
> of update-dtc-source.sh, and were never added to the sync script.
>
> Add FDTGET_SOURCE and FDTPUT_SOURCE to update-dtc-source.sh so they are
> kept in sync with the rest of scripts/dtc/.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  scripts/dtc/update-dtc-source.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
