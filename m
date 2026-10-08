Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D133AAF5D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791476271; cv=pass; b=mQ77QpmyYHkcaEAYkcfVQwqu800pROIgZ6rNLuK0UeH4tgbgnepawkMAN6yca4ywPF0gnK1pxL2blV6x+Rv5rVWtT9LuOIA411QvHJTj+3bew6b0AxC6yqFpuDNSIJxCoplJPmfw9DVlIJ5BkzXqE7cknOLn0LSQLgx1zwxf/dI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791476271; c=relaxed/simple;
	bh=YD5Zk2+iTaJ4IX+4uZHg0/DRAluh5rhgdjjO2MhEgWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KMGXOWTxrFTomWjRUgQkDzReEn9OVB1M4aK0ItjQo+UncJJYvQAYWLl5M6/Hu8fAR+j+xxSBnB6oZ4k+ijnAm/pMNVb2LgoH3xEn7RXAG7dUtlutkaHh8B5NTQdNJo1mZDhvck6gUv8T2SFUzViQETRS3TZ6QBh91/RdLU/oJIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uhg+WfgH; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uhg+WfgH"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8871ada1a26so44709847b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:17:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791476267; cv=none;
        d=google.com; s=arc-20260327;
        b=anJHRy0UoxOemjblY3p5yEjfzdlZais6JFEhxbusMHkPnOVDy2jJb3ufajt1Z6RiSH
         QkP+VVQZkvpiA+vgPwO6b+l9VgvQLOslfxC9cGWJE37l2+vs1Wjopk+UQQYkleDIqXS9
         jArUNl7G3sWzTTLQXFHpquslRTbX9YzvVCTxESLAz/iNyEberzisJ1Wlc24BL4KJ3b+O
         z+k+wdH7VMf+Po1U6pDqRWsWXHJ+V5qyjIonLK3nbsyt3FH0KurAbusoYQc+KB4+wMoS
         +u52mcufz7PJ0F4jw0vHW6NyPXgtWwGvZNW/96Knu5ddio5RnPPSGee3oyGBnlRXZthk
         ul6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HYj+9PiUv2ypfZN7nLYBpdJiWthMiSa2+H81JZdT99U=;
        fh=r2CtDdgi9ffRnTWVsRwHkOfBbHg2mu0Ji8ZBg5huTaE=;
        b=Yjdi2JmKnoG/pl3BONnuy8RERy/wyKP7vGDu+sWhJpz6BnbpeaJTfrzbBlQ0OMg9F8
         lS9Gb/mFATGxfLtySrHYyFIQ5CEq+FAoC2tcfWUFS6rhVMdZ0oJL7Q0IvMTIBWhsYqEi
         Khw1Qk9o0nVjXV2vzamYI16QP0iLLyQ9OynSup2cYpxyar8STv8hVPZ9clE0pV55qHuL
         gvhE0xamCRdfii8lrh63R713IPU5lx7j8mMaK6a4tD+JW8JDm6njyjdhpLkXglViHVoo
         QXZvJKkYeukAvc2MYLGx7rjIdJmVB4RFOyqoh7kHXWjJGZisALg33anxHOyNi36FJKtQ
         Ip0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791476267; x=1792081067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HYj+9PiUv2ypfZN7nLYBpdJiWthMiSa2+H81JZdT99U=;
        b=Uhg+WfgHnjcoY1zS+oASXi83GttaMCdWlLBQjY506kieTrPFDH77YUMI8fKSnr/ibD
         kplsxLYbAW6pqPF57Kexr2Lrw/hgXq7S8mwoPTx3v5bTonqzkRXl+Kfl89MHRgw9HGYb
         OQ2gjf5fE2zH0EMeFWGV/ypVS5xQhZPB0CPuQ2pIOV3XyRewc6Fq2CUrad5Pka8BjlVr
         8zkkcR/A1MiLzTlECD7AXUcyM6g0KzwLLcMlcbxjvb9O2rH2VszvGjmfPCPcDhqw1t30
         6mlgB79dSPWkyQbIXiOUk+pvRwJ0vYDVPv9SkCKQ+2Y1ZVADNknzzenLGjKj7Sy/tJrf
         ZKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791476267; x=1792081067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HYj+9PiUv2ypfZN7nLYBpdJiWthMiSa2+H81JZdT99U=;
        b=pCnK/6XgZU1mdTzS9PaGHYj7KTYaCN3+28d9sdpItDUzOAxlN5FyzNYHwvLcPEu2Ha
         VsmHe5PuHwonBO+6LcWrBEYcDWeM91736+lQMsIndd+GmaCsChQrWiq9WXBV51YU24A+
         0Qu06p5sGJ7a7+3z0qy1Uz9pgh095wYOvUqSj1c4rR8xerFYwaHKfJmq530kBII4P2/+
         VoCvT8Vtqf1G75su0/1t69Dx2Ukq2nhIJDxH/2WXKu7WUb+++x5YE6autqTHAdqT7+6E
         x/S5r1q4s8F28cdSCipayGAJGZvGELNp7+gFk0OHyGo1AdpkdCO4l9njhjDK0UqvTgOL
         S3zA==
X-Forwarded-Encrypted: i=1; AKwUvBxAp0kGOC7Ki8zgnCcq4P0faGkQTGI2KZoSWH7/6iXrJVZhz0TUwR0ITPjMrudCBpJvuDgnr2jYfgy2KXo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRvPjnQd6D1+wnDTTBDK09jUKKSB0hZgMcYGxhSD1+ODgy79ig
	VraARKtKOUiK62aeEItjngNb9hGWgT0CD3bruieKT4rYxyEY6VQmRyxwMLcY68BiQVaQ0YiSbFA
	aIk5plos5g28s/evo/CYYsbZFY3FWeHM=
X-Gm-Gg: AYBFou21rsbD1SPgERzhNP+uE/0zUmqZmz+hcVoApdyNCKWnYTQZKSP5khvnivnGFov
	0uVfKhxYOOcJAw1Z72m3XbuCuXY5S3XhCl9z45q9kpaBJI2gPO+1Ogtk+5YmAMzunqeT7osFo2Z
	nvTDyl+PfvqYIuLYPrkjfv8psITvO2qhE7uIAERgrUkpaIqJuJidZovrvRL6oEuqCVIt8NRCnzf
	F6MF+tjgmi184te8dKJIitoviAoxz/If14R+cfLcoqp65hU+nLEHaCOtq35ouvCSo1zX/KPbvK4
	sZk56eN5gpXKmuRCNHSuCLg1Z4LHidR234THkUgkTmbIoToYD7E9OsxgVbIpXO2KaBFhFcjq5rj
	KgV1RCSVEBsD5/oxj4J8njcTu7NMC0vbOmpJS8Ao=
X-Received: by 2002:a05:690c:c50d:b0:8aa:3a3a:1fcb with SMTP id
 00721157ae682-8b05b1445b5mr31121987b3.67.1791476266849; Thu, 08 Oct 2026
 09:17:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007154353.148223-1-enghitalo@gmail.com> <20261007154353.148223-4-enghitalo@gmail.com>
 <CABBYNZKoSV1_cVJRrdonHT=gKtS6pgoWDM3R5nj5aR0D17SqRg@mail.gmail.com> <20261008152826.2162209-1-enghitalo@gmail.com>
In-Reply-To: <20261008152826.2162209-1-enghitalo@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 8 Oct 2026 12:17:35 -0400
X-Gm-Features: AclHuK-XLzciTkZ03lbRdpXrW52bdi738TY5WQvhuHfZzWnaGA9vG3v7KvyyZUg
Message-ID: <CABBYNZK9Oy2iL5PosxRy1KPup0PgYDfPUxeHemjYjKyAUu4+=Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] Bluetooth: Don't leave abandoned SCO links up in the controller
To: Hitalo Souza <enghitalo@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, marcel@holtmann.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hitalo,

On Thu, Oct 8, 2026 at 11:28=E2=80=AFAM Hitalo Souza <enghitalo@gmail.com> =
wrote:
>
> Hi Luiz,
>
> On Wed, Oct 7, 2026 at 2:15 PM Luiz Augusto von Dentz <luiz.dentz@gmail.c=
om> wrote:
> > Sashiko flagged quite a few problems:
> >
> > https://sashiko.dev/#/patchset/20261007154353.148223-1-enghitalo%40gmai=
l.com
> >
> > We need to check if the logic of hci_sco_disconnect_orphan couldn't be
> > made more generically, so in case the connection was aborted but we
> > received the connection complete that shall always result in
> > HCI_OP_DISCONNECT so the handle don't stay active in the controller.
>
> Thanks, agreed. v2 does that in two patches:
>
> - when hci_conn_set_handle() refuses the handle because the connection
>   is being aborted, the Connection Complete, Synchronous Connection
>   Complete and LE Connection Complete handlers now disconnect the link,
>   with the abort reason;
> - an ACL link that completes after its connection was already aborted
>   and deleted (an incoming connection, where Create Connection Cancel
>   fails at once) is disconnected too, as SCO links already are.
>
> Both reproduce in an emulator (ACL outgoing and incoming, and LE):
> without them the link stays up. The SCO patch now uses the same helper.

I don't see any new test cases though, so I would appreciate it if you
include them (e.g. l2cap-tester, iso-tester, sco-tester that attempts
to abort the connection in between receiving connection complete
events).

> The other two Sashiko findings are addressed as well: the legacy
> Connection Complete path in the SCO patch, and the air mode
> notification of a SCO link that failed in a separate patch, as it
> predates this series (1f8330ea1692).
>
> v2 is here:
> https://lore.kernel.org/linux-bluetooth/20261008151238.2138665-1-enghital=
o@gmail.com/
>
> Hitalo



--=20
Luiz Augusto von Dentz
