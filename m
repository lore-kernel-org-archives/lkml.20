Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628736;
	b=DjohzAgt2RA/5sgnfgqbAUC+oBLAplwr0/y66jKRr3sqjvKYsVp+iieWA6LfL/diLbvq
	 4u/iexa75jI340QPxQCOqGfOOk3+m/qVdDmq6qXsjyZxg6XUcfRHvtVSHkFmq//idxeTx
	 nzF+3DynZ9dwM8QIAKR18DI9YJZlHMl2JfgsyKpnXa3VBqgx4Iktt6gK6zfq7CntVNVl3
	 7/1WY+JQTXxOvibtxkKR39RrJc1baet66rtMvZ4Cb4M9p/vA7x/fCDOYUlH2OsaxXFfxo
	 0tpJEIaAiyM8/NOhmofW977DEnt0MZVu4uiXvyOC3iNU0sDyPq44d0sYKBtHihBOgCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628736;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vtS+ahUD6/AMbO8dbmSrvXk0SZVNl3wA2+s8nuaM9cI=;
	b=vmxs8AXx5wE3BywX60Dk7x747NhPkhqczxOptIkVHV5/hbgrgxpzgeirHHXVkczOCLB2
	 kSjxcPebBVgsLzEdc2h+ATfOlFxGi7HiDrV7HgLzj1263EMnhehzGmtdSnmdqwxkDTdTV
	 cwOHo8YFHPENm7U2ZJ8JytoyF0x5Q6fwWDqti2+JFCtcsbTt99FPE+9/Nd08p92PJqWay
	 iFONHSUlDFuSC59sOZumf1BRTrVHSjBx+31dq+gdXU/Oh6LExM04XGm6vpox0FIZndbWR
	 3gP9PIt7WecMHv+Lj/wb1F5L8r73MH9izAVViFplKiz8iwXGvO1IL9aQPelWZ/R5SuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=os0Hj4Ug;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C2F606A331
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=os0Hj4Ug
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B6991F00A18
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793628735;
	bh=vtS+ahUD6/AMbO8dbmSrvXk0SZVNl3wA2+s8nuaM9cI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=os0Hj4UgpsiOSs6L4/4zhswoyy8R/fLoo0afC6lvSEJMaZ3Ig0pdSZS19dpynNfyJ
	 sOFVf9bd5JSaz05iYdEyRngdsK0y+OL3+4HLbAjscI/nKZTdcarHO3ZNzjtv6UaL5b
	 rJk98wpAC3KiDvxKg1CO6zAP792zAIvOV8ILT8RZUVOQBnrfzqyzpQH4Wbapfcw5Fh
	 dvvWc6hiUNTwcxp615/MD3tO93O22N1ruDmf2xAPKXyPqli+TmyHKj6WTk9R96w1u3
	 fCwqArObELc/h2LbrBTxxdu4qGQEUt6tMzANKBW55wK7a1cJEOxkZvvYojoEMUoZIe
	 m6ul+S/Nas3tw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so2871281e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:12:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx/YPjuJPjDF+jOdS+rKuQDN4VxmtUpydKNZAfk9QBK5tlRaoPUDpad3D4QTzCRTIuZs6pFSzrTkL4CTRw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9atwBG9v0gRnwWYC/010KKnl0/aRydh9b39EylmliJVoy9bF5
	DrLgEf6PaJERBcJEz1Jif3ojqsu41+dbwbxcV3jptRJyDhuENb2gW/SXU4bKPkFyqpGVFxYG5pI
	8lQe2QsNhOfTykR77Oqz6gNk8cp+Wluc=
X-Received: by 2002:a05:6512:a96:b0:5bc:d39d:b451 with SMTP id
 2adb3069b0e04-5bfd9520645mr3437142e87.9.1793628733573; Mon, 02 Nov 2026
 06:12:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-superm1-kbz-222179-v1-0-c91a664ba251@kernel.org> <20261102-superm1-kbz-222179-v1-2-c91a664ba251@kernel.org>
In-Reply-To: <20261102-superm1-kbz-222179-v1-2-c91a664ba251@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 2 Nov 2026 15:12:01 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0ikk6T2=5ii5EGkaMrNeWsmvw_uUjzLHvF3KCcx5QuWbg@mail.gmail.com>
X-Gm-Features: AclHuK_y616LHZNNpN9vVI5OLDXWvIO35XjrED62YW0L-9gXoIlJ6613pW3AJ6w
Message-ID: <CAJZ5v0ikk6T2=5ii5EGkaMrNeWsmvw_uUjzLHvF3KCcx5QuWbg@mail.gmail.com>
Subject: Re: [PATCH 2/2] PCI/PM: Avoid D3cold for HP Spectre x360 Convertible
 15-ch0xx PCIe Ports
To: Mario Limonciello <superm1@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, linux-pm@vger.kerenl.org, 
	linux-kernel@vger.kernel.org, Tony Murray <murraytony@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 2:57=E2=80=AFPM Mario Limonciello <superm1@kernel.or=
g> wrote:
>
> HP Spectre x360 Convertible 15-ch0xx is an Intel Kaby Lake-G system that
> contains an AMD Polaris Radeon dGPU.
> Attempting to use the dGPU fails with the following sequence:
>
> ```
>   amdgpu 0000:01:00.0: not ready 1023ms after resume; waiting
>   amdgpu 0000:01:00.0: not ready 2047ms after resume; waiting
>   amdgpu 0000:01:00.0: not ready 4095ms after resume; waiting
>   amdgpu 0000:01:00.0: not ready 8191ms after resume; waiting
>   amdgpu 0000:01:00.0: not ready 16383ms after resume; waiting
>   amdgpu 0000:01:00.0: not ready 32767ms after resume; waiting
>   amdgpu 0000:01:00.0: not ready 65535ms after resume; giving up
>   amdgpu 0000:01:00.0: Unable to change power state from D3cold to D0, de=
vice inaccessible
>   [drm:atom_op_jump [amdgpu]] *ERROR* atombios stuck in loop for more tha=
n 20secs aborting
> ```
>
> The issue is that the Root Port the dGPU is connected to can't handle the
> transition from D3cold to D0 so the dGPU can't properly exit runtime PM.
>
> The existing logic in pci_bridge_d3_possible() checks for systems that ar=
e
> newer than 2015 to decide that D3 is safe, but this system appears not to
> work properly.
>
> Add the system to bridge_d3_blacklist to prevent D3cold from being used.
>
> Reported-and-tested-by: Tony Murray <murraytony@gmail.com>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3389
> Signed-off-by: Mario Limonciello <superm1@kernel.org>

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  drivers/pci/pci.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 17ec7f065682d..151b98757ba57 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -3039,6 +3039,24 @@ static const struct dmi_system_id bridge_d3_blackl=
ist[] =3D {
>                         DMI_MATCH(DMI_BOARD_NAME, "314D"),
>                 },
>         },
> +       {
> +               /*
> +                * Changing power state of root port dGPU is connected fa=
ils
> +                * https://gitlab.freedesktop.org/drm/amd/-/issues/3229
> +                */
> +               .ident =3D "HP Spectre x360 Convertible 15-ch0xx",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
> +                       DMI_MATCH(DMI_BOARD_NAME, "83BB"),
> +               },
> +       },
> +       {
> +               .ident =3D "HP ZBook 15 G4",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
> +                       DMI_MATCH(DMI_BOARD_NAME, "HP ZBook 15 G4"),
> +               },
> +       },
>  #endif
>         { }
>  };
>
> --
> 2.53.0
>
