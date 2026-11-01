Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793568071;
	b=WKe1BYRQCoOnzGhZ6nXSnrdAJVr+coYyvyMjM0zWAvStCN9vrgBvHJOWy5qYk9dZP2Q2
	 GYndScbdNg9RdawliLiHzJi5U7+Gn8jmrRHgGqUqDBuRiFi7VRMW/0U9bw/qMzNkyJU2k
	 6IdNQQInoPzduxMVmJ4nwzPu2pdNuY8YRfVYS+GxsEdt2IBy17d8nmmNNpu1miWcL3KiP
	 0WsWVlbgBJX1z4wwVY/PeQDBhZFJo8oQhBmsEl3R2oiA+STvG++o+FshY1NYw4VTI8dTu
	 sWQ/uOtW22WCsIK5tGMb/+hBJ9kLryhK1Q3cS6TpYFSyCHVcTb0k0uQRR55Ybz+LBbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793568071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iA4nPd0I6kv/auIuMoh3730KHkV9NOXvNkpunrQQ30I=;
	b=sUlO/JdKALm9snzk8ox2a+Cohx5J2GrBhl9AwV77pqoPVi5/zkZedSXdZ3AdgSmU8Et6
	 nafYliYJ1DjPBD/q2Q92MtQWMJzl1TCEoyFYfR9mPgz4yJyiSHW7UaDOWCtTy37dwk/RX
	 UHwakCYBI4mghH5y48/ZEuoxqUKzQWsfVXPDLFPslFB76iVHjure1mvgBAQ+yPai5+AA0
	 VZSDCu5Aj4t1pPpdMZyV8sB5ct3c4ScnBrvzIDyWM8kWCoTwFI/OqIRv/RB9xqOJKeCVW
	 0KnoyqtfiieoCYZPdnaYQ8Rt3POv9Y0W1Pya001ZOGNWZOvI9RyA6dMzgLw637eTZqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QJu6vw0Y;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6996606A327
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 21:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6996606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QJu6vw0Y
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c40e30c26a4so679590466b.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 13:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793568069; x=1794172869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iA4nPd0I6kv/auIuMoh3730KHkV9NOXvNkpunrQQ30I=;
        b=QJu6vw0YecVPC/yqtrBOLGZGHytMf4YITHelib3e72cEizM25ecWwgGReOj3W5BJhq
         917R0rBmHq8sQG1dbNAV63WM/BwABYDwDu4qnn+sYOEjjzeJsFHSG0p4JX4xYnhNR7jE
         sPWfZexDU/Cers/8tAVsPO5Gxn+oQdCww5FBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793568069; x=1794172869;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iA4nPd0I6kv/auIuMoh3730KHkV9NOXvNkpunrQQ30I=;
        b=Gzq2gEieGUJlXMbo2ReVOay3PSHoNTOCuMDraz6iNctNSnYbuFs6ROcvHHLOjOL6RZ
         0MkSCmH0oJR+OBkTyZp3gpQU1T6UnE9WYKGOa1pc0z75EEtWjlRtkd7FzS7N1L+mHbeO
         GoWS0YU56Z7yTCSqDgPOhtdqg4sbxHzwcdsZZny2vNTzhVvSlP9xrRHFWozzoBGvUIYj
         zvGRTB3e3/1lgMw9bd7VH136yUAu4APVPkqxISX9m9y98acT5HAvvSivBGEFfCRnosXz
         WwVBFLcnIflmLdFyUw0YXW/TTigvJPwATEl19dexgO/CZcbDTaZKAcDxbndrjN4vQHd7
         poIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxTfMnRYq9DsGgqVexvr5ZMntjAL3pYCunCcIawJJiUH3FpXSkj/hOY5XSaQvdCxyVwNj/kWMr/etc5Cc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOPnG7BCnG05ktWgNBGw+pxxJ/5mCHombVGgu+tz8JF6stizjn
	GQ8GAd4I9CoJA4zAXUu8i16pU4xQmug/GHvcr8ZUVXda+G7MRGAJmJLU4Qaqy+VSQq4piDgU0o8
	sU4s=
X-Gm-Gg: AYBFou1JURD4rViL4OSWW6JX2RRs7D9sHvd4zu8X2nCqW7R80NYyhuhZ8j22GZ4D9VL
	23Ej9udTmYGOyMVlv66r1vfcyjn+f2Sw346CuVMQi6lglv0NVd2JSXyLCA/Kz7r1CPasa03EKVt
	CIVpGfHzbSbFKLE/cSEIG6rX3USTU7Fbw9EvUrgrr8r2t+aByBiwLeAfUxHRsBwqSxCKUloopu0
	jeZW91G3QkfwY2saDct1cBm3cT3P6VcS4imGxLUzOPqXnNc2NWeN+L47ngK0pIcdLkYUdW3mBa7
	lPIB+zDOQWUR0tQLmGarfswuw8057I+N0BZF/bbGYtr9HMZv3c7zx6bMb9OsnxJhxbtra+kJV+t
	EqtLyl3JI5crV2i1rIeDXPS48GzHaB+kSoP0qtrLrf3SPZYCFZ6694ECJ9yZRBgFBVr7OQ5OyVN
	0BCL/yUrSdBQFzFJz/u/ZjEaG1H8EiXqpTUjqNpcZWKUjrNq3XDHPpFlXszVzrrDiZvreLdj7s7
	XDb9sCW9+aDWhUqqFmPkklV1Rr71jrkYqSfyW6NrJ5H5pFHCP+27o1HEpdosuduH6U4uAruvbqv
	+5yG4WzbANiMbmLJ3JoKx98f3+d6/uJm1j9uNYS4nxTKpszcG5Ue0vK/wkgchy0mPuQY
X-Received: by 2002:a17:907:940f:b0:c2e:1b6b:8b19 with SMTP id a640c23a62f3a-c49d142cb22mr968740366b.23.1793568068741;
        Sun, 01 Nov 2026 13:21:08 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe10081sm316288566b.42.2026.11.01.13.21.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 13:21:07 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e0d1da913so1748326f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 13:21:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxW/ivi1z2j26RvpHhpazVS2jZc3EDEm6MhSE9EdNenM8cDxl5rjc7MtBQQCZZrBmBveCcDfNIcSm9RxU8=@vger.kernel.org
X-Received: by 2002:a5d:64c9:0:b0:48c:585b:8825 with SMTP id
 ffacd0b85a97d-48e6e2db4a1mr23331343f8f.18.1793568064814; Sun, 01 Nov 2026
 13:21:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
 <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
 <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com> <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com>
In-Reply-To: <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 13:20:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
X-Gm-Features: AclHuK8iDQf3Hi4FgB3rVtlO2TSTt5l2todvm4T0h7_4dZ5xTXqg7HY4PS9Cbco
Message-ID: <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Marco Elver <elver@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 1, 2026 at 12:55=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi Doug,
>
> Doug Anderson <dianders@chromium.org> wrote:
> > I think that was in the the "after the cut" part, where I said:
> >
> > You can see the fdtfactor post at:
> >  http://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.or=
g
>
> OK, that covers where the tool comes from, and the question goes away
> once fdtfactor is imported. Text below the cut doesn't reach the git
> log, though, so a sentence or two in the commit message on why this is
> wanted would still help.

Sounds good. I'll plan this for v2.



> > The goal was to make sure that we could fully reconstruct
> > __local_fixups__ after applying the overlay to the base. v2 of the
> > fdtfactor series handled this more properly, and I'm planning to see
> > this through and land it unless there are major objections.
> >
> > By default here, I'm running fdtfactor with "-S" to strip the
> > __local_fixups__ out with the assumption that today people don't
> > really need them. However, someone could easily override that locally.
> >
> > I'm a little unclear how things would silently produce a bad overlay, t=
hough.
>
> Sorry, I should have been clearer. This is about overlays which kbuild
> applies at build time, not runtime ones like Beaglebone capes. An
> entry such as:
>
>     lemans-evk-camera-dtbs :=3D lemans-evk.dtb lemans-evk-camera.dtbo
>
> is merged by fdtoverlay into a plain lemans-evk-camera.dtb, which the
> make_fit.py path then puts in the FIT like any other DTB. There are
> several hundred of these on arm64.
>
> My concern is the input to fdtfactor, not its output. In the in-tree
> libfdt, fdt_overlay_apply() uses the .dtbo's __local_fixups__ and
> __fixups__ to resolve its phandles, then overlay_merge() copies only
> the __overlay__ contents into the base. Only __symbols__ is merged, so
> the __local_fixups__ in lemans-evk-camera.dtb cover just the
> lemans-evk.dtb part. Cells from the .dtso such as:
>
>     avdd-supply =3D <&vreg_cam1_1p8>;
>     remote-endpoint =3D <&imx577_ep1>;
>
> end up as plain numbers, with nothing marking them as phandles. If
> fdtfactor needs to renumber them, or puts those nodes in a per-board
> overlay, it cannot tell they are phandles, so the overlay applies
> cleanly but the links are wrong. Stripping the fixups from the output
> with -S doesn't change that, since the information is already gone
> from the input.
>
> Does v2 make fdt_overlay_apply() keep the overlay's __local_fixups__?
> If so, composite DTBs would be fine once that is synced into
> scripts/dtc, and my concern goes away. If not, one option is for
> FIT_FACTOR_DTBS to imply FIT_DECOMPOSE_DTBS, so that make_fit.py puts
> the original .dtb and .dtbo files in the FIT separately and the .dtbo
> keeps its own fixups. Leaving composite DTBs out would be a simpler
> fallback. What do you think?

I think your concern just goes away. ;-) The fdtfactor v2 series (and
soon to be sent v3 series) includes a bunch of patches to the overlay
code, and this code produces a fully valid __local_fixups__ in the
final dtb after an overlay is merged in (assuming the original dtb
already had a valid __local_fixups__).

The idea is that fdtfactor and the overlay fixes will all land in the
upstream dtc project. Then as part of this series we will bring both
in, so we should be all good.

-Doug
