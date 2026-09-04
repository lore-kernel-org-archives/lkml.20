Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4E4332629
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788558102; cv=pass; b=t/3e9KKU0nS+MEaCK4r7mnAKUmNlKFyK85QlAeHsIaCHH0pVRMKyz3VwBzEqX+ELqUSxDNtUI+8VMkBCWQoPRvNTEh0hzBmhUwvnKx3Wl8tn7PQkFVRL4J+KtBolCkvGn7I29H8J7eYSpISa/Yys/VT4qqq992VwRZCKEVNo8cI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788558102; c=relaxed/simple;
	bh=6qBbNjXDHOLmiw/AhEzWP+67PIsC4qlOfgllIR4mAT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mhIi/AHGEYbq96xQYdyBQsyF5caXKzX1HdjyR9XdqVkLddRg6MnIc3yaric1toLGrRt3XE8eY1hBZpjNyM31JA/d2hRH4kkBeWfty00eMsP9huvn1vJgsvGEcgpFV/7/ceaAHnUSlNTcFda+ULtesCaYidHRvYx95sn/B6IPZuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEUQTAer; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEUQTAer"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso2271803a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:41:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788558099; cv=none;
        d=google.com; s=arc-20260327;
        b=oQVPWt32DwrRMdvx9SDpIk6a25jbZmzRVqPszEU5BcE7TzeRlKrrHCTZMCXPkkMO0L
         UVmMm5UI5ynyRc7FXUfmkZsCJVCP5NlRrK/Cb41868LF90UO/hxvDDZXuf7J5yMPttvV
         CfPFpO4IHRp0fCetZR/EuSjIotP+9ATHW1AnI6M9IogUsghO9QPZURsUDWC0R12Mw5Db
         om48Uu6S/4EEPAiWTFSR3/mEaVOS1EOWgDTbLvFMrdCHx3jTeDh3cAE1gjVOWXa52QkT
         KLStCJthjmAsH40/HXpLy0fhnU8CZ39lb82vLvcWaJ4ldR5SrEFSkaGfCegp4Z1BhtuX
         GTEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kue2/Pm3HbmZQzjeKahvdcnYX4KwQ6G8saPWSb5Rn6g=;
        fh=QmLBFX80aomtSUct8E1KEJq/B56HA2+lqjchEQr81Qo=;
        b=m7Q28apXHOIjol6D+akSQvFfb9TfLcj6S+VkydNYZ/mJK4wTkLJ1BK92mnNYa0AO7b
         Wbsxq1mcyWWQYz+QCEsPCR0xnrVeErF3P2f6UFyLCnuREFd2Q7lSfUsr7cQp2o3GCyTk
         BdSE6GY87r5iy74JZorqLJt2R1878XNN4e4jvyOhyY08LYaKXztwhRj462vLwnbOk2eL
         khbZ/7Yy92byqT0NMOfNpAhHh053Z3iOfIBnpUWHDDPTu3VsHI6ncJaMa7pmAlBGg69F
         qY/utd048g0mJ1VTyMhQpVn8QwIDYTmmb2PR2rprjSI9s6kwL3bhfdB8QRJznAPrfqf3
         e+zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788558099; x=1789162899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kue2/Pm3HbmZQzjeKahvdcnYX4KwQ6G8saPWSb5Rn6g=;
        b=jEUQTAersCPK6se9AdsihXqp38CevC0tw31LUoS5h7ljgcTGouHg8mZWtDDeMa82me
         saxUL3/87S2T/l8x+ZrbCXL0rXs0CexLZzflinvpQFktgg35ajetV4cA+TpUguUUmPjc
         llXLpXQ/PKu/cyRGCkyegUa/Pw8tHTj88aSHiyO42WOPL3NMx923hfIHrf9b5RiJPX6h
         2RMJZQNgjUR0qDkvmFTU95E3zKmn8qgZAjq2RuLYXYbLqTT2WSD+rsb2vAxqzuc1+Jh2
         JiqQwFujtPpNOsktWMMKdkK/aXw2UU5Xxw5uaQG6F+pQaHXxeJ5xrR6ePLIFjw9HCP7k
         bXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788558099; x=1789162899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kue2/Pm3HbmZQzjeKahvdcnYX4KwQ6G8saPWSb5Rn6g=;
        b=aSgT5eNMb+d/5xnbIGa+Gbr0ZRySt1SRLg6lUvOgJMDt3ogJRo3RxRT84r9kMyTJzS
         ppMCjZlPowVdVYuXYtng7P3lgEYC/1ERp/otVArfz1fef/7sssOOypk8xq5hymhZbI9i
         uIwCRungRBPmxnvKZpUQHubuH5d0x9zdXyyDtVuctU1dZBVRW4k2G5tU5zLiuHOuxI18
         1jcchntQdr5HU9u5kTIcRhnxtma1Is5MM3wJ0GCNIdvF/OJfVxTjh7jTNxXRMd++lcHY
         OHgrUi7wfPvMHQWFmWbsGGrOFgiDsFlFhub1GDscWTTov3UF3DrwdcBKbkdeshfN77uI
         JGnw==
X-Forwarded-Encrypted: i=1; AKwUvBySVDiqv38wpHKqO36A+gx75dunCpOie23J0C6yRWahTPe5j/KhIZnMR3pK+khCaiLh4YNauHloymnxS2U=@vger.kernel.org
X-Gm-Message-State: AFuF++lLwcuOXXNfwgroZniHjDXuHVcjrLvy+hijTEF7QSYJxLmFF9f2
	luG/Ph2aPWwGPq+olnCpYkUB3tXZtSB25k2EyLaYEJYaALRIKmlD68+KiyIar6lTqRLpUN8MLUQ
	xyHDtxigvPuXALOkKjNPGMmMrDu9LW68=
X-Gm-Gg: AYBFou0gKuQ1RPgE0FRUhewy4VErH6xLjvpCzQP1tQKEbpetK4hZ1m+4GqjxiWS/sNj
	t3/C971VPNErYOqLeY6qFiAnRJBORXOj5Tzmi2iLRr1jrmL5q2/XF0muPZcdqqwqfNqmiQetqMU
	zCgX8ApWnxZhZIGtPMoGrK/MTdnpBV81HKVp61XCF490htskIwx0NpnC5F8vbcWOYSAvQxTHOS+
	oJfPbR2WaDWr/1n3HtxkqnGINS6WzO8rejxA95YQHjNEDK9yjdylB94ib07JhndEC697bVF7ShE
	MnAPXW/nn7PQjYMSlY0oEd3aKCB4r4vMBdTXlJfb1X2SLOscE0gk5Zv5/d+QsFKd/UpCihUtBQp
	HCNBihPtLlcPqHefA2WEAsv7golYR8BJkWP5akIjv9xdj0kDwgZnjPIYvDB0RBE6DXwpzBvvJfP
	DoWkKqCKh/Jbkv+NlBjgshPwwUD4M73FMD5CvVliZqiZ3KWVq8hRUjd9pZA0Ab/u9cQg==
X-Received: by 2002:a05:6402:2752:b0:6a7:ea54:376 with SMTP id
 4fb4d7f45d1cf-6a7ea541ef3mr2147241a12.30.1788558099252; Fri, 04 Sep 2026
 14:41:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511032252.361906-1-rosenp@gmail.com> <agH-ivEdw12_3OJz@redhat.com>
 <CAKxU2N-nEx-=KFh9djQRGZVTR_HJTSrJYzAa8NR+4QcNvbkxqw@mail.gmail.com> <agI_ANymmPyyWxuE@redhat.com>
In-Reply-To: <agI_ANymmPyyWxuE@redhat.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 4 Sep 2026 14:41:27 -0700
X-Gm-Features: AcwNN1VOkSQ_1hll8MMht--OgvQL0IoR_OsYRYOz3Zmp855n0-aj2ZBGahPJ2b8
Message-ID: <CAKxU2N8YimZyKFoWtHT+FZwzD1R+MzvaXoCu0MhVEzvGHd9VhA@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: Use flexible array for clock table
To: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 1:41=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> + Gustavo
>
> On Mon, May 11, 2026 at 12:08:56PM -0700, Rosen Penev wrote:
> > On Mon, May 11, 2026 at 9:06=E2=80=AFAM Brian Masney <bmasney@redhat.co=
m> wrote:
> > >
> > > Hi Rosen,
> > >
> > > On Sun, May 10, 2026 at 08:22:52PM -0700, Rosen Penev wrote:
> > > > Store the clock lookup table in the Rockchip clock provider
> > > > allocation instead of allocating it separately.
> > > >
> > > > This ties the table lifetime directly to the provider and removes a
> > > > separate allocation failure path while preserving the clk_onecell_d=
ata
> > > > lookup interface.
> > > >
> > > > Assisted-by: Codex:GPT-5.5
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > ---
> > > >  drivers/clk/rockchip/clk.c | 17 ++++-------------
> > > >  drivers/clk/rockchip/clk.h |  2 ++
> > > >  2 files changed, 6 insertions(+), 13 deletions(-)
> > > >
> > > > diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.=
c
> > > > index ee8c79b938d3..dbb4b6f33abb 100644
> > > > --- a/drivers/clk/rockchip/clk.c
> > > > +++ b/drivers/clk/rockchip/clk.c
> > > > @@ -359,26 +359,21 @@ static struct rockchip_clk_provider *rockchip=
_clk_init_base(
> > > >               unsigned long nr_clks, bool has_late_clocks)
> > > >  {
> > > >       struct rockchip_clk_provider *ctx;
> > > > -     struct clk **clk_table;
> > > >       struct clk *default_clk_val;
> > > >       int i;
> > > >
> > > >       default_clk_val =3D ERR_PTR(has_late_clocks ? -EPROBE_DEFER :=
 -ENOENT);
> > > >
> > > > -     ctx =3D kzalloc_obj(struct rockchip_clk_provider);
> > > > +     ctx =3D kzalloc_flex(*ctx, clk_table, nr_clks);
> > > >       if (!ctx)
> > > >               return ERR_PTR(-ENOMEM);
> > > >
> > > > -     clk_table =3D kzalloc_objs(struct clk *, nr_clks);
> > > > -     if (!clk_table)
> > > > -             goto err_free;
> > > > -
> > > >       for (i =3D 0; i < nr_clks; ++i)
> > > > -             clk_table[i] =3D default_clk_val;
> > > > +             ctx->clk_table[i] =3D default_clk_val;
> > > >
> > > > -     ctx->reg_base =3D base;
> > > > -     ctx->clk_data.clks =3D clk_table;
> > > >       ctx->clk_data.clk_num =3D nr_clks;
> > > > +     ctx->clk_data.clks =3D ctx->clk_table;
> > >
> > > Where's the __counted_by? Also struct clk_onecell_data is embedded
> > > inside struct rockchip_clk_provider, and I'm not sure offhand how
> > > that'll work.
> > Not present. __counted_by does not work with embedded struct members.
> > No need to add one IMO.
>
> I'll be honest that I'm not sure what's correct here. I added Gustavo
> since I saw comments from him before about these types of changes.
Anything else? The comments AFAIK were about descriptions of why the
counting variable assignment was moved. There's no counting variable
here.
>
> Brian
>
