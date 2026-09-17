Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA4053D9EE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664809; cv=none; b=Q9cYhdE25FNSZahcpqIQBHqtYr5/jnjbQB0sBpFyWjJ+MXHR6yyIeBGXRZvGm+xzkaCpknDV3cWdpei0qHqB/q9ZkE2XIWOnTXnBW1odmOyFwtOfjaT4F7dA3FoMkZg+IZDwoldyXGEV6ZcU2DmoaTXL4MdEUHvPaBlwt78Y2Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664809; c=relaxed/simple;
	bh=GPmpO47spf0ioFBus1+ZvimasSyGTu9xPiLNda/gcU0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AfiTyw+h721eEwO/9khlut/Gey4yy2zqmZYPuhzKyDvuwbpMLsI71+1+IJbl0T3uB9Lex2Ih7KlkcLK3Wun/CzZSAu547ujELAsMt5CGOgRB1iZqz9/88GQGRtP1GH9NfIkVHxJPYZLEbjTNPZRMY3L8EnsN2O2LkL59HE8CGFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=clfHqrMX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kevB2JVV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="clfHqrMX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kevB2JVV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789664806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fAYLQjJHeZroGGymoSDmoveljRPTkcO9fXvnIi/lY6U=;
	b=clfHqrMXcc+g/lOz6bUlP1wyxj8OpZLKOocxvnxBO/Qk7oDvbM0UrypQfmZ+QYWpZ9eb+/
	xv8sR58g9TZKpWHtf7G6aar2MJ3lTW5b3N7Lzr9OWXngf8qCfwtjQYsUBrvgwpLVpLBvYj
	D/5RSbmc6YjWQW8bHDAGoOg12Bxwv5w=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-qiNa20pFMsevgCI8JWzkzw-1; Thu, 17 Sep 2026 13:06:44 -0400
X-MC-Unique: qiNa20pFMsevgCI8JWzkzw-1
X-Mimecast-MFC-AGG-ID: qiNa20pFMsevgCI8JWzkzw_1789664804
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530ef845909so21263841cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789664804; x=1790269604; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fAYLQjJHeZroGGymoSDmoveljRPTkcO9fXvnIi/lY6U=;
        b=kevB2JVVcbLGHN8/vd1feLpKGXP4M89V5zIFsp5txrdUW5IoYhEpLmbkLM2Ml7zpIV
         QokQFLS87iy2+e0N8pieZwOUreGUoG348ZNaq7WCl8WNB3Yz0dSlQweJIPCjVkuKmPrg
         68NL+ynuGIhkyA7wsL3BCrsa0wY7UpG1wFadePFnbFSAyglZNTHBFyyUJykgYQBbXYpx
         o2b8on1Lc5QmxuL8L8mumkX2llI6EkEjOzyAX2bKT296W26wCYSUZap00vkBinDL2ban
         vq3DHq8goQKA3aS9H3YGK1QwCHcFIyZqSrBUeM0UUVfwerELjs2wyz7izKqMIBr1C9It
         LIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664804; x=1790269604;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fAYLQjJHeZroGGymoSDmoveljRPTkcO9fXvnIi/lY6U=;
        b=U4LQkmdjhN96d6SO1pOEEVEJgXmN85N0bUpYAiqwy7ehxtQlQEEQ+ZKR9Sy3HDCN0Y
         PIUbx7H62r5h2vhb50iHybGQEHZaeEK1/BrnJoNmdnTc0BYdkcgrLWRHk2Id5EBOEDXa
         lZC6tED+5151JNdbAyLkTW4B5GvIEA4JpUAu8beLfXMPajjDu3sz+RDeb+Q1evebTUYJ
         Cdx8Id9g1NQlRQnelKSfmH8mgFI6Qa6nVs5o5iF2uMzld/BkStxz3LWcm7s3jiwCh6v6
         37GpgWJVJLpfm4wd9hQfE/q93zzfXcVFH6WYKgo87WWmk6JjP/p7Z9s3hRRpHh2XGXeD
         wubg==
X-Forwarded-Encrypted: i=1; AKwUvBwDQhO6JAVyYraIUfC8iTL61DBJtdZD8QIbLvSxJm9U+GrIfgA/NMrE+irvmhhS8mU5JEvCRJc1lw/YlMo=@vger.kernel.org
X-Gm-Message-State: AFuF++lnQmg2/HS5QIv0WwWA7wAsN4UVm3Ar4Ab1JSva5/wjeZ21A1eD
	p5Ek4v9tUSuejmkrsI43J/OpBj05UXsOUDGXa2NO4kUximHOItkbLi8hZLTMnuXnzvOX59R3aCJ
	CMdytp2fjNpLI7L6hlPVQt13ZkDlNJBG6PKoAXky0+hD/8O/RWKvbSllHaNCTmEOy8yaopoQ8fA
	==
X-Gm-Gg: AYBFou1XD1k/SO/4RPYpocbFubfTAqm9Ig0Zd2eQBuzsGXYnfEdmok0HpCLHuI86972
	agaNr/eA2t9GFcQpNRmdvm8ultfkj32OkQeqs38VkModEIAbbdpSnP9nD6Yaa/wwf78K8ZC+wYu
	mTkwuZPrhONvE5bAOFU74kXg6YGTc8TeCILNOXUCs6UruZ8o9M02WSm6AGZOvobwgl4bFfvq3s6
	mP5f91EFJg/T8sU4TiwYlPmW1o165LTTXT9kdWDKEVdxk/DtqPRbhQQG9bDIMYDD3M6qomVmHE9
	f85NPs9RZ4BzI2UROizTiHfx76vVVJumQa/dg4DbKhWSlCs1mY0z8bWa5XJMgAH5+a789xHa
X-Received: by 2002:ac8:5cd3:0:b0:532:9adc:639f with SMTP id d75a77b69052e-5329adc71d9mr16490101cf.67.1789664804084;
        Thu, 17 Sep 2026 10:06:44 -0700 (PDT)
X-Received: by 2002:ac8:5cd3:0:b0:532:9adc:639f with SMTP id d75a77b69052e-5329adc71d9mr16489541cf.67.1789664803466;
        Thu, 17 Sep 2026 10:06:43 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53259aee19dsm56128091cf.3.2026.09.17.10.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:06:42 -0700 (PDT)
Message-ID: <5d4d3042e29db7f08f55bd2d13ab3904c0111809.camel@redhat.com>
Subject: Re: [PATCH 09/28] drm/dp_mst: Refactor build_mst_prop_path() to use
 seq_buf
From: lyude@redhat.com
To: Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org
Date: Thu, 17 Sep 2026 13:06:42 -0400
In-Reply-To: <20260915081910.4142719-10-morbo@google.com>
References: <20260915081910.4142719-1-morbo@google.com>
	 <20260915081910.4142719-10-morbo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Reviewed-by: Lyude Paul <lyude@redhat.com>

Also, out of curiosity - how exactly are you able to get this many
email addresses in To: without your emails getting rejected? Because it
is literally impossible to respond to this email with all of them, and
this has been consistently kind of an issue when trying to submit patch
series that do large refactors like this.

On Tue, 2026-09-15 at 08:18 +0000, Bill Wendling wrote:
> build_mst_prop_path() constructs an MST property path by formatting
> port
> numbers into a temporary buffer and appending them to "proppath" with
> strlcat() in a loop.
>=20
> In preparation for removing the deprecated strlcat() API[1], use
> struct
> seq_buf and seq_buf_printf() to format the path components directly
> into
> "proppath", eliminating the temporary buffer and repeated string
> scans.
>=20
> Link: https://github.com/KSPP/linux/issues/370=C2=A0[1]
> Cc: codemender-patching+linux@google.com
> Assisted-by: Claude-3-5-Sonnet:20241022 [editor_update_file,
> make_kernel_build_single_file]
> Signed-off-by: Bill Wendling <morbo@google.com>
> ---
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Ian Abbott <abbotti@mev.co.uk>
> Cc: H Hartley Sweeten <hsweeten@visionengravers.com>
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Matthias Schwarzott <zzam@gentoo.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Tony Nguyen <anthony.l.nguyen@intel.com>
> Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> Cc: Andrew Lunn <andrew+netdev@lunn.ch>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Arend van Spriel <arend.vanspriel@broadcom.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Saravana Kannan <saravanak@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Peter Griffin <peter.griffin@linaro.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Anil Gurumurthy <anil.gurumurthy@qlogic.com>
> Cc: Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>
> Cc: "Martin K. Petersen" <mkp@kernel.org>
> Cc: Trond Myklebust <trondmy@kernel.org>
> Cc: Anna Schumaker <anna@kernel.org>
> Cc: Mike Marshall <hubcap@omnibond.com>
> Cc: Martin Brandenburg <martin@omnibond.com>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Jiri Pirko <jiri@resnulli.us>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Chuck Lever <cel@kernel.org>
> Cc: Jeff Layton <jlayton@kernel.org>
> Cc: NeilBrown <neil@brown.name>
> Cc: Olga Kornievskaia <okorniev@redhat.com>
> Cc: Dai Ngo <Dai.Ngo@oracle.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Bill Wendling <morbo@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> Cc: Kanglong Wang <wangkanglong@loongson.cn>
> Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
> Cc: Qiang Ma <maqianga@uniontech.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Breno Leitao <leitao@debian.org>
> Cc: Thorsten Blum <blum@kernel.org>
> Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Ashutosh Desai <ashutoshdesai993@gmail.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Johannes Berg <johannes.berg@intel.com>
> Cc: Miri Korenblit <miriam.rachel.korenblit@intel.com>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Cryolitia PukNgae <cryolitia@uniontech.com>
> Cc: Jiaming Zhang <r772577952@gmail.com>
> Cc: Will Porter <mrwillporter@gmail.com>
> Cc: Cen Zhang <zzzccc427@gmail.com>
> Cc: "C=C3=A1ssio Gabriel" <cassiogabrielcontato@gmail.com>
> Cc: Rong Zhang <i@rong.moe>
> Cc: Arun Raghavan <arunr@valvesoftware.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: loongarch@lists.linux.dev
> Cc: linux-mips@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linux-edac@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: intel-wired-lan@lists.osuosl.org
> Cc: netdev@vger.kernel.org
> Cc: linux-wireless@vger.kernel.org
> Cc: brcm80211@lists.linux.dev
> Cc: brcm80211-dev-list.pdl@broadcom.com
> Cc: devicetree@vger.kernel.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-scsi@vger.kernel.org
> Cc: linux-nfs@vger.kernel.org
> Cc: devel@lists.orangefs.org
> Cc: linux-hardening@vger.kernel.org
> Cc: linux-sound@vger.kernel.org
> ---
> =C2=A0drivers/gpu/drm/display/drm_dp_mst_topology.c | 15 +++++++++------
> =C2=A01 file changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 7ce9e212770a..229b5fec44bf 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -29,6 +29,7 @@
> =C2=A0#include <linux/kernel.h>
> =C2=A0#include <linux/random.h>
> =C2=A0#include <linux/sched.h>
> +#include <linux/seq_buf.h>
> =C2=A0#include <linux/seq_file.h>
> =C2=A0
> =C2=A0#if IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS)
> @@ -2216,19 +2217,21 @@ static void build_mst_prop_path(const struct
> drm_dp_mst_branch *mstb,
> =C2=A0				char *proppath,
> =C2=A0				size_t proppath_size)
> =C2=A0{
> +	struct seq_buf s;
> =C2=A0	int i;
> -	char temp[8];
> =C2=A0
> -	snprintf(proppath, proppath_size, "mst:%d", mstb->mgr-
> >conn_base_id);
> +	seq_buf_init(&s, proppath, proppath_size);
> +
> +	seq_buf_printf(&s, "mst:%d", mstb->mgr->conn_base_id);
> =C2=A0	for (i =3D 0; i < (mstb->lct - 1); i++) {
> =C2=A0		int shift =3D (i % 2) ? 0 : 4;
> =C2=A0		int port_num =3D (mstb->rad[i / 2] >> shift) & 0xf;
> =C2=A0
> -		snprintf(temp, sizeof(temp), "-%d", port_num);
> -		strlcat(proppath, temp, proppath_size);
> +		seq_buf_printf(&s, "-%d", port_num);
> =C2=A0	}
> -	snprintf(temp, sizeof(temp), "-%d", pnum);
> -	strlcat(proppath, temp, proppath_size);
> +	seq_buf_printf(&s, "-%d", pnum);
> +
> +	seq_buf_str(&s);
> =C2=A0}
> =C2=A0
> =C2=A0/**

