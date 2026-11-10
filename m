Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333292;
	b=NPTzO9ii+buqUSV253wWCwjDYzrjFzjY8G6eLUABzI1PlYvtu1N8gvl21tbr2QnLxRjn
	 zQqxXTbnMrBKterkQDROgbtlEU0USTXEhFN0tksDE4JYJfZXQr7hUdFnSZF/asjGxU9WF
	 5tTGpFCht9/+Ex6BVsyVoHTZhVDkfk8TtviLm8JPQMZAYVIkBhRa5kGERTYGJp8iY46Sg
	 c19Px0fudSs6gEQ2Q7bk1fg2LxFDhjRlyGBZgkrcIXOrfZ2aWs/foVWkaK1526iuM6i+U
	 ktmvriH/GcAAviVL+EL60Ec8QeSzquUG5Aq2MIklrqxQ7OKZX6g+2UMNAaqtaAk6tww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333292;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zP8fZhrxg38D3pFbn2ZYa3+X1FsyIW75yZtjJDJNluE=;
	b=wpGB6mVJKOjmqUhHwuuEkPfC6bNxB85xGIk2yRVCI5F1q9huWxRO0FCFIIV8Bttb10hu
	 DWhkoNlUWsJ/sCP3uwDwharnffpORiLOPbZIb9j1vuIbq/udxpykWI3tmFAlwbOpsiPUz
	 Jb4DalHh6tahqvuHR3CFaMzQViwbe9V3QLG4Gmw7bLVtx8h6VCryLEpehY830tfHuR1UB
	 s0+7L0KVFhQTs0z56MgqW5lekDSsyMqwKoSaYJzobg1iIYQqRxD7G6XIydKQHKaplywmj
	 8DuiJrnDnisat5RP7D7+77XiojGpG8ldRWwUbSYFfIOvqkmB2ZO0gLnfQLfcTx+SEEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LezZI98t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746CB606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LezZI98t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC541F008A2
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794333292;
	bh=zP8fZhrxg38D3pFbn2ZYa3+X1FsyIW75yZtjJDJNluE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LezZI98tbPwmX7d/tmK6BKDrV6DLNiycu1iZ6LfFbbo/9IO776NupBdnknIhOWVgU
	 JEtOjNSrDl7GREUDKDOPmDnXwtRKuj+moEnyO0w8glM7uflfO7cMIUNNjwIYiEZBhP
	 6oOWz0+tKQHzVcKpgIScFteJjuee0uSc0mGV/J8Ef9ITwAAZNXb4EUiYmow02SxdU/
	 uCHUShtJZ718/AhB1/oxv0XEfPmlLhbcM5n9nMpvqHvH1WNyiIn9HquADHpMup2lI7
	 RI+JdBEV/Fha4qYEUANBvYmo6C66c9cGICdF60gWTcQFNprEtCCX+5kTYtP/EJ3nRx
	 wMs4O+ZYNl+aw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c14f3dab66so2355085e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:54:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFyTq7K6qYiaRjrwnAv3CJL+zn1MLIn7lZlk03jsfZfYBQcHZbv6XefNKPCv/+2hypIiJyBjndU6V3wUM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JpcEF/izilD3jFveDi/x3ZGxiOO+SpP+AO5vqw/NHYd1U/oKD
	VWtxNK7vFLPAsOgAPgcJBJDDsyIMjUioYXDIIzbJFCDcIWrLPg5tGnqvuWo+FTdXIr/HBfyoL3l
	hWEWpLgbNy8mTmZc5m8gg0jV+D79e+6g=
X-Received: by 2002:a05:6512:3412:b0:5c0:b5f9:2f2a with SMTP id
 2adb3069b0e04-5c15c7faf64mr95400e87.13.1794333290746; Tue, 10 Nov 2026
 09:54:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107-0d0c29e10a-acpi-configfs-1@mail.sdu.edu.cn>
In-Reply-To: <20261107-0d0c29e10a-acpi-configfs-1@mail.sdu.edu.cn>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 10 Nov 2026 18:54:38 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iN+GTaSs3G=Kbq0u6FCh_eVX2K2W1zCnjM2fNUCTfpmw@mail.gmail.com>
X-Gm-Features: AclHuK8TooCU38iQ53MAGHHLcecMhnYdHtStqZsVlht5Lfzj1Xnxt_2S48imf44
Message-ID: <CAJZ5v0iN+GTaSs3G=Kbq0u6FCh_eVX2K2W1zCnjM2fNUCTfpmw@mail.gmail.com>
Subject: Re: [PATCH] ACPI: configfs: Fix potential table item leak on removal
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 7:54=E2=80=AFAM Guangshuo Li <liguangshuo@mail.sdu.e=
du.cn> wrote:
>
> The table item type has no release callback, so dropping its last
> configfs reference never frees the allocated struct acpi_table.
>
> Add a release callback and only unload items that have a table.
> Keep the AML buffer alive: ACPICA retains installed tables after
> unload and requires the caller's buffer to remain valid for reload.
>
> This issue was found by our static analysis tool under development.
>
> Fixes: 612bd01fc6e0 ("ACPI: add support for loading SSDTs via configfs")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> ---
> Validation: Changed-object compilation passed with W=3D1 in the recorded
> configuration. No hardware/kernel runtime test or full linked-kernel
> build.
> OpenAI Codex assisted with source review, patch implementation and
> commit-message drafting. The submitter has reviewed the changes.
>
>  drivers/acpi/acpi_configfs.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/acpi/acpi_configfs.c b/drivers/acpi/acpi_configfs.c
> index 6071699c7165..89ef17d5d5a5 100644
> --- a/drivers/acpi/acpi_configfs.c
> +++ b/drivers/acpi/acpi_configfs.c
> @@ -199,8 +199,21 @@ static struct configfs_attribute *acpi_table_attrs[]=
 =3D {
>         NULL,
>  };
>
> +static void acpi_table_release(struct config_item *cfg)
> +{
> +       struct acpi_table *table =3D container_of(cfg, struct acpi_table,=
 cfg);
> +
> +       /* ACPICA retains the table buffer for possible reload after unlo=
ad. */
> +       kfree(table);
> +}
> +
> +static const struct configfs_item_operations acpi_table_item_ops =3D {
> +       .release =3D acpi_table_release,
> +};
> +
>  static const struct config_item_type acpi_table_type =3D {
>         .ct_owner =3D THIS_MODULE,
> +       .ct_item_ops =3D &acpi_table_item_ops,
>         .ct_bin_attrs =3D acpi_table_bin_attrs,
>         .ct_attrs =3D acpi_table_attrs,
>  };
> @@ -224,7 +237,8 @@ static void acpi_table_drop_item(struct config_group =
*group,
>         struct acpi_table *table =3D container_of(cfg, struct acpi_table,=
 cfg);
>
>         pr_debug("Host-directed Dynamic ACPI Table Unload\n");
> -       acpi_unload_table(table->index);
> +       if (table->header)
> +               acpi_unload_table(table->index);
>         config_item_put(cfg);
>  }
>
>

Applied as 7.5 material, thanks!
