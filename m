Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B9851615F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902003; cv=pass; b=KbV7cp1hJmPFdTsFRP4rOsYRQbvNP0k/jp3nDFK6+JRxtK7zK1PycWOvpLpnvXyizpBweo6GDm8frr7P8pfVK2mZBmiNQwZ1eugPKdggK85lPMFHWPmM6TCUG9HBRiZusnIPBJEKXsGAi2tOLKPB6XOGFhEIobMqSD0aHQ2XXUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902003; c=relaxed/simple;
	bh=qb4v9ce3vW54adqKyiPtSKvN8GLywJnDxqxjs3lPL4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t9wxveAqzJ89TrquQxCGR72F+Dqjjm3zBmEdtVcSyr7N4fxIuwXtEAto1TK9GX3jR09W7XMJOxxj4LVGoKfokhg7FoBi4IseWPHpe5Jc87EDklPC4LCmEzzQCPrFZNE/By27gDy6wzSuNAKnfsumOqaoyE7SWkpB6rVY0Gjltmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKl3eQmT; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKl3eQmT"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8aca54b75d4so35014527b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:33:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791902001; cv=none;
        d=google.com; s=arc-20260327;
        b=nfQYJ2Kl6rAYkJuoxH/Yf7EjlZAE5ecY4hW77GjfY8TnDiKKdd8mA6hV4f8HeT1zj5
         tqnFzgw2oE6VIAsxmur1mCD4FXqHRYbtOiVzheE4nUvMt+HxpxhjCHZoHVYZxO2A9RMF
         D7u719pB0FKnGFiy4Fy5rUVubz5z1FoPJAq9vXdtsiTBVcvBt1iliiNKv2erjH9vBJQY
         jc+0/VjKIisVWVt3p/X/8PtcXcCTbsYfjRKQ6WOAdzkV9476xKb0W039o2y8jLoO1nQD
         h1ubWohjd55SpP6N8o+Xqwp4NfGuku8/x13eEPRykja/axR6EzqovVoNoOvbR0wRD/mL
         0x0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Injtiv0xWANNcMbgfaK5mbJL2OVBhmX68XzHqiBufSo=;
        fh=mxWugL+Sgj2zc79WAx3a/RRVO2XBIct5NcDRKz9QAQE=;
        b=LjYUtBhzWTu/4afLVwXr9jNvj/jaOhZgf5MRj8AASkpWcsSLzLkfkK1ANHXUpAk7YN
         9MrfC7mHXaGbk41H3HQcSYn8cR6fl+yCEpIx7plknbJLm46y5iuqzCxhc9snzPYjaasm
         N/Zl10Zm/8PCkO0/dcYaSP8FQ+jmpe0+aQRPya7F/4vCo5dgGKFgRYTI63ypFYgono0Y
         1TmgCSx2DGRLDdNrgVjcjX1e8DFH1Y+MgiGtbRk76xFceH4P3JCSMjgcggkEnYDD72vr
         uJWHIHQuw9+IvhNk28+ZKwpMJpI5p0uyutOGx8VeudyeKW9jLYhwUgaS6AzTwVqAoBLp
         ywCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791902001; x=1792506801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Injtiv0xWANNcMbgfaK5mbJL2OVBhmX68XzHqiBufSo=;
        b=TKl3eQmTI7GESi+N2ttTBGwV3MkWYbPgH8FAJinNa1kS4/264PZDUYA5HiKkylUoRE
         7FMnrYZTWKi5n1T0Tj1kHfWByB9dUNfZdvJZnrEEVRjVPXPA5o8+KIcp+1cI+9GOxM/W
         ntsmglSlXXJ0VYEdw6DVD9pp01cXXSHBjI7C/FvTzp4WdytsqhdC3m/S/eHQTJXBBUu4
         fYlODQkDFoHdwFhrV4nHiOZTr7kocnWfhM5gAx2HGYgESDCTCBISuv29V3mg9cYNAhmU
         RNpkxlVeQtZVos8Qq6U3As3qPsvD5iwhO8+YJ6MT5U79zZ2TYMPd8vssKCcsqvn9IL84
         LpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902001; x=1792506801;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Injtiv0xWANNcMbgfaK5mbJL2OVBhmX68XzHqiBufSo=;
        b=O+Z7LlAB2tUr3Sx9CUF9f/8Kk1P8bqi0MRXtFM8YY/BzYQP/vhSY2HVpkqiuz3GHtt
         CN0D6IXDAq1nKZsJ3klaFpqH0sgEnWutVN3Ctsh8knkIpMM9Ps2qJGweaewZFB4gH1Dg
         +FVlmbMPgqKlzuVVp0V54VE68C1kBjXXzFdpBP56CwUq/XzUaQLUGoutG4yBUnHS5OMK
         FCowxfbD0Cv2+pw1CWuO+s0GaRnpM6WS8aIHOjXbfDR2NM0xizjRm38o9ll3BKVqobmD
         qUwf3psUj4aLWzmYIM8FxAog4az0NNx8b+OT+yUWwhYbpJLjaf0QlqhDivHHkBwBwRmS
         G+vQ==
X-Forwarded-Encrypted: i=1; AKwUvByYLRKahLbZjQrT9XuVczLgVK8E6MvztStjHO/Boebei/rKw7YL6grkbxT99zFIwcc7baypHyz/nrc31Ns=@vger.kernel.org
X-Gm-Message-State: AFq9FYLG+2G36VGUOFinya6RjBh0aVwXQeHV08P18vz6T1VLX0mnwfQq
	Wnwvz/pDMRJajp/O1wscsxYmL29Q5nusCapSZI4m73WFfjGUEV/nULPr/VkgM/T4LWn5JKRxZmD
	x+um2/QsO7XsyJmdQrCgvpy8CZ7maJg8=
X-Gm-Gg: AYBFou0FWY7DAhYoA/LduI0QvmwCiA+qO+OgB5CdGFg7b7/uu+LrSEleGGmFlQE6c/G
	JCKEeyCFwNQ4YAZuS5rBcSGjUvwyGRPVrI5Ry2Lqo5DACdsKC5sF2G1+tpk/w7ikruuEqgSQz51
	12773LZnP+zkK/fZ8TAWDKlvHi3aq4vCDcrUVTzXyfw+KF4cgihTHwqr+aWIUg803T0EHWtG+PX
	xNzcfJwq1uuuOKc18DLnsBOeLHwri742H6QibK/3HhOlFK81bZZ6WpdtSrnvU90gMqnBpLEGJZ3
	9i5cqLjvhO829ER+FpCSbZPF+AKlW/mQterPPBOpBQDfZ0QyDVqT7vzqwlmtsV9xgFU4yeY7HVT
	IrB0BF2MK7qaG+R46w/9o4aaRJ7QdJwxYDgn0a10IiQ==
X-Received: by 2002:a05:690c:4992:b0:8ae:8795:86b3 with SMTP id
 00721157ae682-8b07d3c1b1amr45850977b3.10.1791902000951; Tue, 13 Oct 2026
 07:33:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013033118.501182-1-cochcoder@proton.me>
In-Reply-To: <20261013033118.501182-1-cochcoder@proton.me>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 13 Oct 2026 10:33:09 -0400
X-Gm-Features: AclHuK-RXwkksTGff1z6MxwYz9XtMvL74zspdazrlPsiY6llIrUAQoIWCm8vD3U
Message-ID: <CABBYNZ+o5P+KhPX3ndcB28u=QB_4wpOjoJfHWk0_uu-egmx=9A@mail.gmail.com>
Subject: Re: [RFC PATCH] Bluetooth: l2cap: honor local LE connection interval range
To: Kyle Pepper <cochcoder@proton.me>
Cc: linux-bluetooth@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kyle,

On Mon, Oct 12, 2026 at 11:31=E2=80=AFPM Kyle Pepper <cochcoder@proton.me> =
wrote:
>
> Intersect a valid peer request with the locally configured interval
> range. Reject disjoint ranges and preserve validation of the original
> request before applying local policy.
>
> Assisted-by: OpenCode:gpt-6.1-sol
> Signed-off-by: Kyle Pepper <cochcoder@proton.me>
> ---
> Submission review notes (not part of the commit message):
> October 12 no-intersection trial accepts [16,24] and completes 30 ms
> with STATUS 03 02 18 and normal host TX; the user hears silence. Volume
> and multi-day acoustic comparison controls are incomplete. The working
> intersection yields 20 ms. Maximum-only rejection failed in kernel 5
> and is not this proposal. Generic minimum/range policy and LL-path
> consistency remain RFC questions, not established by one renderer.

I need to check the git history but I believe we tried something
similar not long ago that created interoperability problems if we use
strict range matching like this.

>  net/bluetooth/l2cap_core.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
> index 49a998804..49e201d3e 100644
> --- a/net/bluetooth/l2cap_core.c
> +++ b/net/bluetooth/l2cap_core.c
> @@ -4968,6 +4968,13 @@ static inline int l2cap_conn_param_update_req(stru=
ct l2cap_conn *conn,
>         memset(&rsp, 0, sizeof(rsp));
>
>         err =3D hci_check_conn_params(min, max, latency, to_multiplier);
> +       if (!err) {
> +               /* Apply local policy only after validating the peer's re=
quest. */
> +               min =3D max_t(u16, min, hcon->le_conn_min_interval);
> +               max =3D min_t(u16, max, hcon->le_conn_max_interval);
> +               err =3D hci_check_conn_params(min, max, latency, to_multi=
plier);
> +       }
> +
>         if (err)
>                 rsp.result =3D cpu_to_le16(L2CAP_CONN_PARAM_REJECTED);
>         else
>
> base-commit: 964430c038967fd06643e866f68115664e1a1bd1
>


--=20
Luiz Augusto von Dentz
