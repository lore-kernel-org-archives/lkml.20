Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1A46FC5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768817; cv=pass; b=P+DoXd+3lMyd6nUDHKGL1CdfW9x5afb2yQkPXsNYLx3lQr+Y62cPq6T/Np2EP539Bivi9yNwz4ib1V+XTuwZUTHM0Ko5oLkAuOOwr7PM5kbgWSJ+9uCzxXsK+L+zST6DF6XXBheZqkVuQ2JXfqv33QUEVDms+ptkQJ6bYzCSmJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768817; c=relaxed/simple;
	bh=ScZ2jn1jN9ahyKzbPLc1GllGnjcjnL0NJZyRLezyHog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tK067IzlkU1KJ6vEwVPxQbG5cA+3c5Mlxa2fDorGU5rvuITyi9FGwIXb8LviOHamVhSMsPjWt+oHWXTos6Nn6gffc4cuAFRHGNQ7WpxG1iBmUsyNbofCpn+GJ6mE2vL9ugtMmVLBsCsJnVxkNtghdjyFi3Ze78j1CcezXnJW7PM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYLUTUKr; arc=pass smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYLUTUKr"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6f74f6b46abso42851eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:33:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768815; cv=none;
        d=google.com; s=arc-20260327;
        b=TkHsYWVLGtkEZ3WU0Z21BSbtV984VhgLrh7YCW08AS+7+Ix86wsoOaXwnrJ4Za+/KZ
         Qx6PwmCkvO1llAOXFRsTVrbkrhMiSgs2rxv6qoL91t9yF/Z73k1z4vz1+016MVN1xLhf
         HIQy1QX8mpO0FxCAG1HmuipD8iKg/s/t6e3Mr2H/5TWsWb5rh90YpdrcCa7KqRU9Y3/A
         dDU1UeRyVM2n70pnEc/ndl3Lq1TFyr/zP4GeNIJvS//toMA1yds+MEjg8eoDPzrzzmin
         zbcYl11S7NLgrfpM82gcShvTiMbOj3ewB4QArFN/i67Sd9OU9IJLttm/xaF1AIhhMEYF
         +Enw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LNoJ4HxuYSJ0Xf/3dUjucPRkmyWxxHLDqr594GDd0MU=;
        fh=9jlOByjS6Z8StF0G5ubyWlDnggq6eeQtZdsvXAwhBK8=;
        b=PxCB+l8MRjvsZmcQfVdCVwNb7T4FqA7JSTxWVpEYcMlEUbaHnsOFDUnWhupEycYE14
         s0An0Ljs5ap/nZOt/XQZjH8Knh2yp6KMP6lqVHrc7ja3b3Tlr7XTxk4/5eW4P272imQF
         dFFOpZpw5A+GV9UQzDCnqZPEbgD1yqQ0azTLlQMSLY4f0ggeh+2doQdK+jVJw8y/VfgF
         llY4UmMVWeY3Sogb/PmpB3gj1CFLDPH6AJT0gHvFnNTocHJ1fyOMBQ8j7U6WTxkMEBpR
         R8gPRjUY8psidcDRqXIBhK8IjkpodwUua1JK32bLqE7zSDW8nEAuB4WHi91vKcs8Yrmi
         kqpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768815; x=1792373615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LNoJ4HxuYSJ0Xf/3dUjucPRkmyWxxHLDqr594GDd0MU=;
        b=kYLUTUKrklmK173IsWvDWF6oQSFzxLlRXTqLwljDxMRQN/cUc39yeGlL/rpDdJS4HF
         bA5s8fuVhMF245KGd/X8+KMtwICJh2nJa5OLoFdbIJMOnWuelYbdx5cMIXqTHkeWhGaK
         8x2NOOicvJqE8uC8PMjniXbpR1j/dLk0o7G1qJEvshtm1tGwE+7XMimWuSxMCgQG+P+9
         qzu7JDFAT9/kV5C5e15oLF8cwqoE9Mb2jyGPkLiUVTGnt1/LFQ3YTx+NvSLoqKoQkGJQ
         iTNw5iemdpu2n55Bu/68OSDVaKsI6NHcYEroYG9DG0oSFRTKe3esXJL4yz/k6Npi4xGy
         at0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768815; x=1792373615;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LNoJ4HxuYSJ0Xf/3dUjucPRkmyWxxHLDqr594GDd0MU=;
        b=gALOfJza8TKoHsT5BkRIMLUxp2GPpHeizk9l7QNYZfYbL1+uGXV8A0yAPurqw2o6fD
         NFByIn/e8kXV6loelQazOix06VsdRTxpTkRqzpFK+P54yXH2Y0r7DWI3Fe0CW1olK42m
         XubStF11y+X40sG5aPK08dowuh7dVvYiZIdys+Eb6FIL4GdYkNq0uIff8q+ap9kL9pTC
         n7vn45SgR2QcwqL045v/+pHBI0qW0kfKLQxHobRqeoQAsYjzrp1Z6YXc8q5SLvxFsV8v
         mi2axWymmvuu+QNK4JJPbBnqZ8mAUkHyfyhokiRnuLpo4Ascx2a+joDoRWElhlP/I/wY
         KuUw==
X-Forwarded-Encrypted: i=1; AKwUvBxf1+zOedcDYfyAl2OYKAGoJNVT7PQttjTF2qFSe3BaGru9TF5lgpKuhySSeS48b2PC7cVVQf0tIcbBq2E=@vger.kernel.org
X-Gm-Message-State: AFq9FYK61/g52sBr9fLSateWsfLctA9EcrMCMVfQqU4xZUTW4NC0NJIs
	v4iXSuOyQkn71SLNdlYe7XeANRk4Bmm3vEpiSPxvFvcJ3zzFFHOZNfA3TmuVuBFT7Xuiz41yn40
	j5KyQjcBIAl6GAxiBgc1yy1nJpElXZ6Q=
X-Gm-Gg: AYBFou3R0v5iezoaeendqCMYkjW+KTlhSVTEKoCwxPGOg6F4fUE6ApveUGEWCxraKQw
	oyp/7EXvi4mdIn9B99zin2NGa9bvfYkKmv581wi6861j04rLHIbjaeOqgwJSmT5W9A7LfDG7mhg
	w92V2yUTpJyqiH/u/f429rSFJiAVUomPeScINbAUKbrrJQHYbKFkpcAmtG/IXG9+haXu9rzvcU1
	73b6Czpo1yt0J7ut/hemwA/+D3ezcDgRSuuKg2JohErSOWBv7i1er5I8lsoguNEDoNlSXI8kadr
	pzmbZmmQiy/W6agVF+WThSER7w+sn9KCexw+uQSZ0B7+7ttV5f0Miu0=
X-Received: by 2002:a05:6820:603:b0:6f6:8edc:2d4a with SMTP id
 006d021491bc7-6f68edc32d9mr783126eaf.19.1791768815434; Sun, 11 Oct 2026
 18:33:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930200158.174118-1-b-padhi@ti.com>
In-Reply-To: <20260930200158.174118-1-b-padhi@ti.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:33:24 -0500
X-Gm-Features: AclHuK9mSjV4BCyKuLSYCUP_iYl7bD7WHz4EW_eabE8Mz2jrNqdpetz4EBbM-kk
Message-ID: <CABb+yY3pO19Ygxw3yo_NcF1p=b7qsn16UcNjkNzfmCdA1d=sKA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] mailbox: ti-msgmgr: Fixes for polled rx and
 trailing bytes
To: Beleswar Padhi <b-padhi@ti.com>
Cc: nm@ti.com, afd@ti.com, u-kumar1@ti.com, linux-kernel@vger.kernel.org, 
	vigneshr@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 3:03=E2=80=AFPM Beleswar Padhi <b-padhi@ti.com> wro=
te:
>
> This series fixes two issues in ti_msgmgr_send_data(), found while
> refactoring the ti-msgmgr mbox client (TI-SCI).
>
> Patch 1 fixes a duplicate message transmission in polled rx mode.
> Patch 2 stops reading past the end of the message buffer when the
> message length is not a multiple of 4. This is a preparatory patch for
> when the mbox client can send data which is not a multiple of 4.
>
> This series is independent and can be applied directly.
>
> v3: Changelog:
> 1. Add Fixes: tag in [PATCH v3 2/2].
>
> Link to v2:
> https://lore.kernel.org/all/20260930143810.2419010-1-b-padhi@ti.com/
>
> v2: Changelog:
> 1. Use memcpy() to construct the trailing word to handle host endianness
> (Sashiko bot)
>
> Link to v1:
> https://lore.kernel.org/all/20260929200159.4033010-1-b-padhi@ti.com/#t
>
> Testing Done:
>  - Boot tested on all TI K3 SoCs.
>  - Boot tested on keystone K2G EVMs.
>  - Tested that these patches do not introduce any new warning or error.
>
> Logs:
> https://gist.github.com/3V3RYONE/18d0c3ce912ab208b53b5887435ff09a
>
> Thanks,
> Beleswar
>
> Beleswar Padhi (2):
>   mailbox: ti-msgmgr: Do not report rx poll timeout as a send failure
>   mailbox: ti-msgmgr: Read exact number of trailing message bytes
>
>  drivers/mailbox/ti-msgmgr.c | 32 +++++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 7 deletions(-)
>
> --
> 2.34.1
>
Applied to mailbox/for-next

Thanks
Jassi
