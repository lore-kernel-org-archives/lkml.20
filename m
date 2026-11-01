Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570709;
	b=5tIPzm9dtjWeUvEKkW1ySh9xyzJQqIOaZzpQ04QU9k4fZYEBaTo8OYNji7RKKhWk2SOm
	 DWGLipiZdSWRQGntwsndeqUpcHYdlsGHimLQg70/9cHV92lkMul0pCdfOdHaML+Et/xA5
	 czQ8BIGS8U+9mOhTxCVTTJtMh9ljHaC/Ekb4fsqq6T4QnOctn1IUeFUCqJYLzPr9dqdPu
	 4OtLHhIaU0d+sAXr1yMvWQvVSpVoqf3KL67xm43PpodI5yg0zTecZcjvbyjW0RLYpRk2J
	 IrtdB4rEi8gQYB0sfB3jm0pg/nxDDvGTZv/2k1dDVt9kCJca/3SZCNZGOfnph4BHhuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PFyk01eVFOp6/1QOM1CgFjRZU1l8aTMWLgQJiWpehTo=;
	b=YCBSLAzwJtHYF6j8yTjuqJ6DobT6IRBeQmz6KOzEtKJMxHkCRQERSWvd2RzhK84zxBc2
	 2oSfoDd+6Uw6MyOh3fu4zSznPOLGKeUmMh/S3VYkQt9gZDDGnCFJ4sMse9x/u42l9i76y
	 aCZyi0UG2AnaqXWkYgthLnLU6ey6P4DH8haXTMHwccd7WqD5UBfM/9KZ/J3iA8NNnSm/0
	 bEM/A0f97uLQ/NoHy/8qNBd8u6JaD8ao7cP79gi+39gET+bUJxqbTgFlT0PeBv6LJNC9g
	 21rb+ZNDWJTChy1tBKp5musQk3i4ROxbrklbx1PkaJ+Fver73945aUIfY3uMTlZLzcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="WtEd3/9N";
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E58B606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E58B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WtEd3/9N
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c43fbcb4393so357017266b.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570708; x=1794175508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PFyk01eVFOp6/1QOM1CgFjRZU1l8aTMWLgQJiWpehTo=;
        b=WtEd3/9N2fq+hivTKAAp3tUxXXxt88yOCjaIIoWpetmVouUTX/Bo9jnxzVGVc00zI6
         8da0YJ9jX16X83JGTXd3N7KHpUX+Bm1SEVa6kslMmEDe+ywgbUp9MlQZ8fDyYfLj9kQ5
         WuvU+Ax5ZgE89XhiQCX4SRUFn28O0a92dJ2kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570708; x=1794175508;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PFyk01eVFOp6/1QOM1CgFjRZU1l8aTMWLgQJiWpehTo=;
        b=FUYKW4FwQZtGFVlRljFUDT8njgSMr2kLBhwJapPT8MMiFscoznsY6jG1tQbPoVp5cT
         lRlOqF9aGWUwdYeuZMXDcYv2J7OKZe9ruWX0unwsfD4+CfmzK9InTkd1/F4rzog6Zxt6
         xBwpWHQCxK8PF689vVTy1J8E7LAWmiTJxhI3lbW/s3XWlOnK4FdL2N/feYV8inK0xBa+
         L2lbiGq7kLkjpNDlmLuoOpuCckN+FhUtB4aO9L/CFa34vndyCZVrjpIQyXHzKbU2md3S
         tlUEAjXFSyBVItO9in+lPLiuiEs3ckCaRYZ6qQzcVaex4qaA12RSqSKFZaCFyJAcTPXi
         G/LA==
X-Forwarded-Encrypted: i=1; AKwUvBw+Q4nD3lI0nI5H3ZSU5sdB5SXfzjQlPPhzx3nmh4xIaYfwPHNpXrfH+vs/YCtNYksD9TAQNKXJUsFciYY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLo0rRtwDPEZPs8u7y/kIO9tvHLAN4dhEITxV0v0nlXyM6jan+4
	0E/v9IVEMxaqCBctpNVGMwbpCtiRSwmD1Ovo7Gip6FXp9gienyCY3XJvtGHT4rwP1JcL62ow4v1
	zDPl4zJp3
X-Gm-Gg: AYBFou0hj50bjDnTo5w/htla+PyoyvIcR3wDDDsUzPsob09hFJx43Zerlg5VbgupdHd
	Dw83DVkjuqbR2l4uc0//O/UCkXjeA31du3+gVMVgDE3DFsql25WE2Ten6x0wkY5m+50eaHp3dvc
	B86mp8EeNA0HZT5DSWmJkSciK2RK/Qb0vlFi7gsq49q3NOVm2FFeaqQK+nSAvjbSd2tOCa90WZf
	Gv0CyCcGg+Qm3Z7s3AMD0lC8H8EVkj2rHKCJbDBwHefFanULhKvnN29eQxiTzny7UvqjdjyGXac
	2tsCJv9IG2P8wNEWXFNxIHGd6XQEiAxhdwlixuJIs/5feGtta3bnQQpdVqz7qKoOrDA1rVp7bUF
	3B8hHE35aRQtJH+5BT9YNq99hFf/MJpXn6HMlr9UhgPUdDccvq1sXCmy6vl/5FS5VakMLmNfhc/
	QTR4GbWgTgn/Q7SqRCdDybyOQwKauOaiXdVNvS0X/JFvQlyle3dmAx/hx1TPp+51rNsLFM3AIW/
	t7sHr7h825HpEjH3mB2qI6lne+bMIkXNFROjdyrpimtq71OdYPHtOAz6YC2McGcN6/hHiAmYhR9
	jDHGbDceO2CR1FsVx2luLU/zE82cslKebZS9ZkjvNa1BCRuoMW4xVtejg71VrIQUYAA=
X-Received: by 2002:a17:907:7205:b0:c45:c030:732c with SMTP id a640c23a62f3a-c4ca7ab0a5fmr695406366b.41.1793570707697;
        Sun, 01 Nov 2026 14:05:07 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4d128sm319694366b.51.2026.11.01.14.05.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:05:06 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49d05d51553so14363265e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:05:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzjZuqxCcTNErEk5jdD2R/stiU2EmeqJDSyavmbYa8Jy/QRq+NeN/EDnicL0lcy1wMAJitSH5VXL9y+R28=@vger.kernel.org
X-Received: by 2002:a05:600c:1987:b0:4a1:6517:ccf1 with SMTP id
 5b1f17b1804b1-4ac16fa2edbmr193511235e9.9.1793570701196; Sun, 01 Nov 2026
 14:05:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-5-dianders@chromium.org> <auQXQU974oMkWe01@gractus.seuss>
In-Reply-To: <auQXQU974oMkWe01@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:04:49 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UmpZPc=CzrQdE0FNxNcqK2VyRbyWy81_0E6HWfZ=es9w@mail.gmail.com>
X-Gm-Features: AclHuK80IahgGAWhxdJr2Lp66ILPi_cbUp_334UE_M06wTdmny6SXo3fYvtRZmw
Message-ID: <CAD=FV=UmpZPc=CzrQdE0FNxNcqK2VyRbyWy81_0E6HWfZ=es9w@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] libfdt: overlay: Factor out fixup and fragment
 path parsing helpers
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, Oct 29, 2026 at 8:55=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Wed, Oct 28, 2026 at 02:55:54PM -0700, Douglas Anderson wrote:
> > Extract `overlay_parse_fixup_entry()` from `overlay_fixup_phandle()` an=
d
> > `overlay_split_fragment_path()` from `overlay_symbol_update()`.
> >
> > A subsequent patch updating the base tree's `/__local_fixups__` node
> > during `fdt_overlay_apply()` needs to parse the same `"path:name:offset=
"`
> > entries in `/__fixups__` and split `/<fragment>/__overlay__/<subpath>`
> > paths in the same way.
> >
> > No functional change intended.
>
> Conceptually good, but has a couple of warts.
>
> > +/**
> > + * overlay_parse_fixup_entry - Parse one "path:name:offset" entry from=
 /__fixups__
> > + * @valuep: In/out pointer to the current NUL-terminated fixup string
> > + * @lenp: In/out remaining length of the /__fixups__ property value
>
> It would be good to describe how the in/out values are updated.

Done. Updated the doc comment to specify that `@valuep` is advanced past
the terminating NUL byte to the next entry and `@lenp` is decremented by
the consumed entry length (including its NUL terminator).


> > +static int overlay_split_fragment_path(const char *path, int path_len,
> > +                                    const char **frag_namep,
> > +                                    int *frag_name_lenp,
> > +                                    const char **rel_pathp,
> > +                                    int *rel_path_lenp,
> > +                                    bool *is_overlayp)
>
> Returning the bool this way is clunky.  Better to use the return value.

Done. Dropped `bool *is_overlayp` and updated `overlay_split_fragment_path(=
)`
to return `1` if `@path` is under an `__overlay__` subnode, `0` if it is a
valid path not under `__overlay__`, or `-FDT_ERR_BADVALUE` on error.


-Doug
