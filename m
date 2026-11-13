Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595189;
	b=dqMhspJU7Iro0UCDQFu30323buc6cgI9Xn/uCMeRRpw1LLeW9Quy67ijtqXPtREzBNhm
	 nQgPv6lrHq+TqhDoXjKAciOPYyvCIQl/uwX6CRVYz3ni9uVAAkeFEGCRKwWdEOAhjnB1o
	 4iyDGiD1QsO2SjN78SRc6FgelXONSJfmmr9dptizTZzFlqIRxLuJD3C48aEeEwSFKtjFw
	 rHzZDBnuZ5l8Q5fBT1hEaOH8bVbGC4lsa0n6+qeqrLz8D3H5D04eA/ZaIcGeHvaPq5N44
	 OUsf+A7nJzEKvhJ06klPngU6l2ts2H9Cssa4nGuSyjoPGewV9GEhppQF5NfMVkjOsKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=3NBWFEB6FU4/z3ljBBQ8NoiqjrMo0KVomaOmiAC4b50=;
	b=3sjoJNBn3ynrQ/TpzrA0qej9eqROz7F3EblDk/s6P/83DxSSrdawsmcryWPWXVdwwcc+
	 BSug0SMvWBvJ7+slF1RHYJ2MsgrFmqf1jeJunTgqc/Kh4mXGujh/j0TTgW9kIGM0ebPLD
	 HBaZcjkoOeSmwZacM944miwrQ966n/zKQGVE8Q2Gw8yMBvsS1Tvp7ne4a43xj1GFowlUM
	 efLpu35V6z82ouGl6Jv+Srf41mrhBOkjNAJwvcZcjLMUVjH2k1ZUgI/7bOmhpOuT371iD
	 t7XkYdsO+4lKyFD8gJk8Z0yUpO8wnEDJ0B7JLQRfTt0bLMhBk8n0RVrSIDC4wNq9+Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qV+oc8d0;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BB16071892
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3BB16071892
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qV+oc8d0
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso481155f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794595187; x=1795199987; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3NBWFEB6FU4/z3ljBBQ8NoiqjrMo0KVomaOmiAC4b50=;
        b=qV+oc8d0hSgnBdxOfdlcbt3gZsZIo6yoeaCK65K5fkRU+FjSHaBWnHZSFnQ5tVF8Vg
         jvMUiJnk/8K/QN/vQPKBYvKhu6OQs7B/6R/V7mKggi1e3HVzBX48JKU22vy6fWVCyjo7
         FNYnSx8KjCnqHu0aEsu3D+RUa5t/P3Vhbbz21efPcust5Tr8FbSo514Ct2BjzZJlbLoF
         Vg0c0sVAaqwoEVYf6es5Y9I1CzVGo/68ZPXtuNvkfpc8dkxLQbV3tPXdcU27Ti+dg+jT
         Q8/gnsRcA4KjzxTU8cAOtjwMEr8OWiR3Kwcx4KyG9Y+RpMFOoRJt8MI22yzCx+xpM2rQ
         URJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595187; x=1795199987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3NBWFEB6FU4/z3ljBBQ8NoiqjrMo0KVomaOmiAC4b50=;
        b=w2m+njhwDO33bhdi8B5UFC+ca4k61vn+CDYBAvunrvPEOEMnzc4xoC8WqoA7ag9pmb
         C5iqp6YBmv8lYcFAcnT0KlFYiQ2FWLfgs718JX+8Ch3iyzhZ11qpxyR0Ma1Ej9cWiZjg
         9/mY5itblUiw3ooVvsjyQSDwnP5OVSHncewoi7SxiNhQeCdexQ78f8nlz9KeH94uysa8
         O2qr1XAMPyNQB7/KjH6Z3fCTXq0vjOGC6kWuWzKwDDpnQrI+yOoLvZtriwugo8Uah34g
         UmTxoLu3dClcAqEVvO7JJmeLkSltIMJwT824iwl7Za6jkZYuAMd0s1gsy4aPTlgxlyH2
         WKTw==
X-Forwarded-Encrypted: i=1; AL+hErEPFdrFVNP4JiOr2ZUU1K9oQf94qc7bMqK3iqx2BBunRwZqzxVP9Mvyo3IelksozBCtbotgLTCWz1qEknM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YEz3EWvZWCF8EcTvti5U+p+ZHzZhWdy+ZGfTJH58jcR191Cv1
	XIItBYUYgY/exj0JhnyIC+dbly3OEshDXwpeCt3G4+b0erHYtO9PxcotWjjrvgzX
X-Gm-Gg: AYBFou2Y0Js1Q5B4f9jLG4rWatqlO0V1WSOhw1iqY93RviP9XdlQJLCzerwBi7+lxci
	FhBSyzoMWQdDsdFYp2rDcKLjtDmuSE+giMUCTbtFtpushSyuQCxvLnO6kfiZbjytFLivHXAdZJ/
	XUPO/9IVFeKX07+aNSDfFRYHWkD9CG1TBIzv9aa1N3/Bx+8Uc0wqItyeHCxfMhXVihp5GihW85i
	5Ts0rACJz5t4XAeIwuTNXOs0MllHwHndYY8WwPQGDTqC33JVIEByifjWpMhbEq2IeLwR2gG3kYN
	SrlynB6h10gwdZeBKv4QBy82XYEyBA8Q0A5cEZz/yB/kG2BCuyxv+QWO46JqC0sy6FpZrfWzhQG
	mIrg/mUksdbRMmKn/1IEzbOZXATVfKiMBrZcdEmt1GM9JOUl/0+VJM51GQNMaUS52boYDPLjFMA
	b0xKL57qO1KIvOwpyaI5aKeUWM8q8y8Qf8v9+4r73dxqfF7ZKBevL8iYiDy0kbkMV4AHb2UT6ln
	4Wl6rJPiPef8z5S8rAr7cgCS/evalVRj8Ns0qqqO8QFliN6kYkvHXpjqb01oiQ8MtofDCBbAl3e
	MsjADptuMxKIUd/Tj/PowgG4GE8IjquANFm9EX6ekkiRaFd+fMUMQg==
X-Received: by 2002:a5d:5f91:0:b0:493:d5f0:4e4c with SMTP id ffacd0b85a97d-49c723fc45emr7653677f8f.23.1794595186940;
        Fri, 13 Nov 2026 10:39:46 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm6346363f8f.21.2026.11.13.10.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:39:46 -0800 (PST)
Date: Fri, 13 Nov 2026 19:39:41 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Konstantin Meskhidze <konstantin.meskhidze@huawei.com>,
	Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 4/4] landlock: Clarify implicit handling of
 LANDLOCK_ACCESS_FS_REFER
Message-ID: <20261113.7a962670e000@gnoack.org>
References: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
 <20261108-b4-landlock-refer-nonfs-layer-v2-4-2b405fc1b3aa@gmail.com>
 <20261113.Ahzeu2seey4e@digikod.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261113.Ahzeu2seey4e@digikod.net>

On Fri, Nov 13, 2026 at 12:28:56AM +0100, Mickaël Salaün wrote:
> On Sun, Nov 08, 2026 at 09:23:51PM +0100, Günther Noack wrote:
> > The LANDLOCK_ACCESS_FS_REFER right is handled implicitly in a ruleset,
> > but only if any other filesystem access right is declared as handled
> > in the given ruleset.
> > 
> > The old documentation was still a remnant from the times when
> > filesystem access rights were the only access rights that existed in
> > Landlock, but it became misleading when we introduced additional types
> > of access rights.
> > 
> > Fixes: fff69fb03dde ("landlock: Support network rules with TCP bind and connect")
> > Signed-off-by: Günther Noack <gnoack3000@gmail.com>
> > ---
> >  include/uapi/linux/landlock.h | 17 +++++++++--------
> >  security/landlock/access.h    |  9 +++++----
> >  2 files changed, 14 insertions(+), 12 deletions(-)
> > 
> > diff --git a/include/uapi/linux/landlock.h b/include/uapi/linux/landlock.h
> > index 24510e5d8479..7e38b9d1bf12 100644
> > --- a/include/uapi/linux/landlock.h
> > +++ b/include/uapi/linux/landlock.h
> > @@ -22,10 +22,10 @@
> >   * enacted.  Vice versa, access rights that are not specifically listed here are
> >   * not going to be denied by this ruleset when it is enacted.
> >   *
> > - * For historical reasons, the %LANDLOCK_ACCESS_FS_REFER right is always denied
> > - * by default, even when its bit is not set in @handled_access_fs.  In order to
> > - * add new rules with this access right, the bit must still be set explicitly
> > - * (cf. `Filesystem flags`_).
> > + * For historical reasons, as soon as any filesystem access right is handled in
> > + * @handled_access_fs, the %LANDLOCK_ACCESS_FS_REFER right is always denied as
> > + * well.  In order to add new rules with this access right, the bit must still
> > + * be set explicitly (cf. `Filesystem flags`_).
> >   *
> >   * The explicit listing of *handled access rights* is required for backwards
> >   * compatibility reasons.  In most use cases, processes that use Landlock will
> > @@ -462,10 +462,11 @@ struct landlock_capability_attr {
> >   *   This access right is available since the second version of the Landlock
> >   *   ABI.
> >   *
> > - *   This is the only access right which is denied by default by any ruleset,
> > - *   even if the right is not specified as handled at ruleset creation time.
> > - *   The only way to make a ruleset grant this right is to explicitly allow it
> > - *   for a specific directory by adding a matching rule to the ruleset.
> > + *   This is the only access right which is denied by default by any ruleset
> > + *   that handles filesystem access rights, even if the right is not specified
> > + *   as handled at ruleset creation time.  The only way to make a ruleset grant
> > + *   this right is to explicitly allow it for a specific directory by adding a
> > + *   matching rule to the ruleset.
> >   *
> >   *   In particular, when using the first Landlock ABI version, Landlock will
> >   *   always deny attempts to reparent files between different directories.
> > diff --git a/security/landlock/access.h b/security/landlock/access.h
> > index f9eaa2f53686..c4a81f7dadeb 100644
> > --- a/security/landlock/access.h
> > +++ b/security/landlock/access.h
> > @@ -18,10 +18,11 @@
> >  #include "limits.h"
> >  
> >  /*
> > - * All access rights that are denied by default whether they are handled or not
> > - * by a ruleset/layer.  This must be ORed with the .handled field of all
> > - * domain->layers[] entries when we need to get the absolute handled access
> > - * masks, see landlock_upgrade_handled_layer_config().
> > + * All filesystem access rights that are denied by default as soon as any other
> > + * filesystem access right is handled, even if the access right is not
> > + * explicitly declared to be handled itself.  This must be ORed with the
> > + * .handled field of all domain->layers[] entries when we need to get the
> > + * absolute handled access masks, see landlock_upgrade_handled_layer_config().
> >   */
> >  /* clang-format off */
> >  #define _LANDLOCK_ACCESS_FS_INITIALLY_DENIED ( \
> 
> This is good, but it should also be extended to
> landlock_upgrade_handled_layer_config()'s and
> reparent-exdev_layers_rename[12]'s comments.

Wow, good catch!  Updated.

Used the same wording there as well, "...as soon as any other
filesystem access right is handled".  It's a bit verbose, but it's
unambiguous and I'm hoping that we won't need another edit to that
wording.

–Günther
