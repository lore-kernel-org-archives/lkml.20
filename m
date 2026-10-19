Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48A051188F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419111; cv=none; b=epg9gS2hJZGcMBmwiT2v1j79XktJaP56LK7CxNFqzaKYCLXW19LxVIlgnmQ1K0D8VnNPTrfpVnUcexbM6x4bIllA0AYXDyPauBvYLNqZN2JWKUbKfHBRS0HRBfDJzrWZPslxxujKXKnpdfHcy9idSTCRaFMZ4q+iaF5ulgwDu8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419111; c=relaxed/simple;
	bh=OkpEifD2KWm3GsbxAZ0xxE8P5d3Del3yRNhkAe0sUgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BIgYfYeKKuqpu6zW8tKWYJXWfhlTXItsMgHBSFXXt2Kyn4CvSNlMG0ump4xIUtjHNKJDnLTlf5qxidodS1RRqnnziTUAewdjkVqaa0k57AmEA6+XJv0HNoix/HP2eSNfGSZP1eNK9jeZCk5RMNrgnEtnuIQ/SCynfbwWgktyhwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7c6e6822b11so556022137.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419109; x=1793023909;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nUNNwLjM6Li4QaQna+9UtyB3Cj/CRAMDg2QIIEt5PZg=;
        b=njbsFFhNkzi2uQI1bs/y1T/WCjiUOoOIKJ9tUusQ/fUkMTZBNe1JDch7Om054E2qxG
         Of0etOjXzmruZU0JsXkKBsCBvbKxNe8WTKH4MUydp7EvQlgP38l7Q7/WKRNPVWlkmU6T
         PCLf8IbFaJmpWT7s9q43ehyCQp3jSOFH6eI6mW74Y80n/G2xKO4G3uqB4rwpfbkiOTsw
         sNv/9YE0xB8yxhbrYt0yaSS/brUcRqGqUyi2Evd6TTJMEVC0fi/8+0bhOE1SxE2vZcWG
         37GlQbyLdfm0VUC+S9T59GQjrSmKytWOM9xbBFVjYOUTfdmz1q+nh4cWpfRhoXPtKz3G
         Q9Hg==
X-Forwarded-Encrypted: i=1; AKwUvBxLfjCPg6AnqI9JAdV5l1ROVWosRTXZFtqNG+xGFXo4ewkkzL7iaMtbLNoyJlXPnAwYQzqM/TtmyybD/4Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKJfbeAe04zQIb+CvgwnNDjH9dZuWezI59yb9dsCNZ/1axg8iL
	57aPXkyUcY0OHsvnR4JTm8XvsoNgz/43+IfDcCaAzV+BFoel33vay9siGzBF3epj8fY=
X-Gm-Gg: AYBFou3BUyRlgiXai7C1hNwzvlO45JYq+E4Jed7vdsHsKQkKd2q2NJU82paC8z5iNZu
	vYMJC/b8EqIyKrIM/UmeMvaSP0/3/H5N76WiOR/RFSzw97jAcGXjzzASDJsEyFVuXNokcOtgoN/
	3NRqUwjXMrgiqG3ZOrxNy+o2owDx8XnFNwS9BMQz6IUNf8nEZaJdpNRhmAxWEvpu1hleCbC4OJk
	LAXNla4+sRjBJ2tg50fU5DUDYHIP7YvRESy6rVf0mvyo7QdIKVr/xXbAupuLoWJ7epc6oPLxuIX
	e0icgRZYBGrtoxGoMOXbBdkLZ7bzEhJgSHeuZp/MEYSIxBTF4ReT9t8yGpo3rihq2uA0PH4QWXU
	5ba2whgNRJHob2xwnPjyNPJHmDxuQ0xocn6qAHTywGjIVGm9YvPicWjPlng9yji62ZQaRijs/wA
	19tBECkiME4JaxGF5Y9EwOo+Xz7vluie2IHczlijfqjVAyDUXFkYWZ2IZtDge01QI+XTnFwfuOe
	XQOOhctxZDVXC1KY7eh1kaTBGrvrpZgNVVnrNFiaHRaJAY=
X-Received: by 2002:a05:6102:2b8b:b0:7c8:268:ecd7 with SMTP id ada2fe7eead31-7cc36a54c5emr1548920137.23.1792419108590;
        Mon, 19 Oct 2026 07:11:48 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb3adfd0sm241123241.12.2026.10.19.07.11.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:11:46 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7c6e6822b11so556005137.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:11:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByEYnHBPQ046VO1M+s+EBU1FyWWcxrFIBctthflgJYUaNyKOyy4owZrvQbrrzP4jpYW0X/wl1oXELHKPi4=@vger.kernel.org
X-Received: by 2002:a05:6102:3749:b0:7c9:624:86e1 with SMTP id
 ada2fe7eead31-7cc36b021c9mr1767854137.35.1792419105797; Mon, 19 Oct 2026
 07:11:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003083200.459705-1-yaojiale02@163.com> <20261003083200.459705-3-yaojiale02@163.com>
In-Reply-To: <20261003083200.459705-3-yaojiale02@163.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 16:11:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXpVv2=GHJK49ykUiOcgKuOrW9_0UbQ_nfx2R-MGuhV7w@mail.gmail.com>
X-Gm-Features: AclHuK-whmRf2m21YwZdvIAowJDZUbKGaSptoysY-titwCbr4PasDFMX4zXs_ms
Message-ID: <CAMuHMdXpVv2=GHJK49ykUiOcgKuOrW9_0UbQ_nfx2R-MGuhV7w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] pinctrl: renesas: rzn1: free maps on DT map failure
To: Jiale Yao <yaojiale02@163.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 3 Oct 2026 at 10:32, Jiale Yao <yaojiale02@163.com> wrote:
> rzn1_dt_node_to_map_one() appends mappings for each DT node.  If a
> node fails after map storage has been reserved, the top-level callback
> returns without releasing mappings built for the current and previous
> nodes.
>
> Free the accumulated map on every error path.  The caller ignores the
> output parameters when the mapping callback returns an error, so they do
> not need to be reset after freeing the map.
>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
