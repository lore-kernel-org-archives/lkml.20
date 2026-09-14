Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ED147ECC7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395210; cv=pass; b=e9L7sNa/caWAVIEBZS5Q4Et1Hbucmoar7Kz+sEJ4eBIkD6u+/GCLv7jMjQ/sVr/ciUD5IP6SqWK8E0EHA3+Cvp6BFhaLXs5Grk6krq0IB0g6r6XO7ib+mMKcuHp+xUycnw9aQeXqK2eISoM2o4UDnRPGf0tfozmw7gc/hsWdxk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395210; c=relaxed/simple;
	bh=HcrVb13U8U1dp118Fj0sRZh6DKiZuFwN4zfw0H9EUfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hf2gORsnyuPy6gZsR5aeTUyFSYYAup8q1Swo/dN0F+FLkMZVTaykMAISxxFZkqktyJkJTgLSkfo43POp7v4vyQw1Q3f1XJFIeSS+xKMqNXo2uWKhyKgPIVabitY+Z264IQp+tQ+p95/EKVXHZBVONdITKkb3r5+kpwKRjUj41sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UztkEWeD; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UztkEWeD"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66fca0709caso3011799d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:13:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789395208; cv=none;
        d=google.com; s=arc-20260327;
        b=lmC98wEOYSl3g4XMOtEVWR9FA5EP9DDN0bias8l6BIWyXSwH/OPWhen43oVTTv/Yxt
         SIAJ7xkQujxTVn6YKYfeHO1pBYfLNTPozKEE6GFBvFYhsiYii4J52Dl5RwqoBECmSWih
         JMWd3qZd8xW5Gl/umsuP/UTXzHR8azBT98lf1OyZLzrTRSBFF8BETnTFNqNG/w3lInTb
         f6JSO1A/Q8KWP/My/+LKeTVoBa1UJRmUmDUx0OrSszDVm/sfqHgMxVYg7dGTnCkpZ8hU
         wW6fnJhF7+EQDYZkYrusfZ3f6u/Dr5CpvhDvivoT+JtXPkumaLuafgkTDBmgU/32nv2T
         vTOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p0YA9Y7XdajM96S/hal4rI1ACWMLOOoO4cBFd0Cz7Dg=;
        fh=wz7/No5kY/GWLmOr0aI5qguFYAqRC24lIqlrMp4toVc=;
        b=Rsh4rH+a8ty3/Pt4gVcZLVH8qxYZ7YZRAIxwp1qf4ikNS2LuN3Fvht6J4edqF6DAnA
         30HXrT0pBNXJQ1TZ+WNFk1OxgBjtG4YDFFFgwpIsMB5y5o6bJWJEx0bTfCItE0lsIeA2
         QBxIjKF6cgUikoScgWJP2gVGbwYvBWMWWxJs2ph0/vOPQh2ALF78jjjOdABXnzlZKg5l
         82d4W3N4Ci1LCUBNPpH6ogw7hP5AqlzB5xGlQrEp8uJU1EkkgyIF+vB9sWYiv5ihEiSI
         4AIjl2lcW5Fjqqav64VCP69ZExJbZa7/hf0aA3BWaC5ezg+LZY8xQuQh8+HcxjnTpcEI
         FS2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789395208; x=1790000008; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p0YA9Y7XdajM96S/hal4rI1ACWMLOOoO4cBFd0Cz7Dg=;
        b=UztkEWeDVPGK35cr4zBccCBvvE8fFRAWQDzn2JvsG13AV6MCHdu/le0q4V/R1mJtRx
         JwPCgxTo/1xu0fqKEEIuHg8DfMs6OBVQk5TLUPoA8vE8Db2xQFhXYrNn9tE3+ro+efRw
         4taJotbFC+sk+Eui53STknbX+kdwZzK0Vw/AjhoUgorfzcQi8wnk0Wjmwdvflq2F3qFf
         jupMXpIhCtziPm5ofxTmM1LleYgotf3kh28gp5/ALNgRBVXw32eWURADELYFmta2tq6M
         oJdrYayuGBR36WOPqrDsRfvxAidUp5h/pPDmavS94WfnHXoCBdTVqfcdvYiiuiStrXji
         ybkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395208; x=1790000008;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0YA9Y7XdajM96S/hal4rI1ACWMLOOoO4cBFd0Cz7Dg=;
        b=mvfTBrPTFPju4e5TVq8I020CqanySPTZVqRLq7LkM3H11Kc02J/7lSUhsXOd4N1mwt
         VtPJWjzZyMGgpIuV4ERKtmFsNpGgpeITqV0fZkaBgCDPcPEgAW5LMef2EluL77F0Domj
         V0k7XPEUBL6fKDR+DKqyvw0EiJMa+HVNTFOX+R+niw4ZlGpGz58UB3yT4SKPgZ9LgbH3
         vKjHpEdyUaHbT0XT90LGh463h3uWryecyBgBlgca8G+6tOiG53XwNTwIsHin7O7590eR
         16qaAC4ZSxejQLrsvGSti0B9QFAE7V9wf7mXNDiYNqaj/wk0qHdY3eaDIBb3C2QxqOz4
         tCBw==
X-Forwarded-Encrypted: i=1; AKwUvBw8PLlNy47JPrV8hE4pnS95qLyZE4B7Cm3exJAtt34enQWDSiiYWzIimLl5GiOl3nzIgZzOV87b05LIwyw=@vger.kernel.org
X-Gm-Message-State: AFuF++l1uZRU9cvpiq2/LhC/ICeNxgbRWs+p34tXvk5p5f+lWP9H+6XI
	Zto1ghtrmRBObgy8KId36HpHYok8z8zDqsyURTrAZBKHKTWchu1fxSgXlV7ybHgVqpcrlLJAjPI
	eVN6+viRyTmDJEHQy7xCmcREWivQ2uHo=
X-Gm-Gg: AYBFou1/ZdT+sqIZN689yOxwBXS9xTZVuW6mDOUqyHTGem+8G5rcbq9MXZsRmRSipK6
	JR00qKx1Cx7pvDUiXK/aXLS+qDrDHCXQtcpZh8TnB3YUd2sC7aV7pWIR5SpHpq9UefNenck9aNR
	JS8n0FFHFi3Dh9Dg5/ZL8saj6GSb0wyl8QfmYmabAgBRjWwJMKbEnRx0RK2JPWkidX3aTaf+cs9
	eTSrS5OhCP0OmfgBUt2d7uHjg5dsKmsMVUkDFwuGr9H10FrrMpdlUDqK9TwXkXsrwxR+zZvO4Qp
	9PXi3d9l7a3b+nXTz/szpVcPBWubAqcI2LXUGOi6Jib9Te4zB8sw4DCUcBXjAIWi8q+d/vqfDxa
	LpCBoWjtDbWWIlqAXXCL3d9ltaIMbD6+fUUVkPTxJxE8=
X-Received: by 2002:a05:690e:4390:b0:668:8e5c:ff98 with SMTP id
 956f58d0204a3-6714dfe05bdmr386913d50.23.1789395207755; Mon, 14 Sep 2026
 07:13:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-bcm4356a3-bt-v1-1-ce44d0abb5db@gmail.com>
In-Reply-To: <20260914-bcm4356a3-bt-v1-1-ce44d0abb5db@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 14 Sep 2026 10:13:16 -0400
X-Gm-Features: AcwNN1WrwmpS_SIKuwSZN8pnxrVfPeJjc4lrLwC0U9902tk4YSJcvvLjDIoMLvA
Message-ID: <CABBYNZ+553teDOW-43qkf_TCyNr31LP8gS1vQ7YfKvAZ9UnzLw@mail.gmail.com>
Subject: Re: [PATCH RESEND] Bluetooth: btbcm: Add entry for BCM4356A3 UART bluetooth
To: webgeek1234@gmail.com
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 14, 2026 at 5:38=E2=80=AFAM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> From: Aaron Kling <webgeek1234@gmail.com>
>
> This patch adds the device ID for the bluetooth chip used in the
> Nvidia specific Broadcom BCM4356 PCI-E WiFi / UART BT chip.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/bluetooth/btbcm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
> index 463d59890befe..14acea7325478 100644
> --- a/drivers/bluetooth/btbcm.c
> +++ b/drivers/bluetooth/btbcm.c
> @@ -506,6 +506,7 @@ static const struct bcm_subver_table bcm_uart_subver_=
table[] =3D {
>         { 0x6606, "BCM4345C5"   },      /* 003.006.006 */
>         { 0x230f, "BCM4356A2"   },      /* 001.003.015 */
>         { 0x2310, "BCM4343A2"   },      /* 001.003.016 */
> +       { 0x2409, "BCM4356A3"   },      /* 001.004.009 */
>         { 0x220e, "BCM20702A1"  },      /* 001.002.014 */
>         { 0x420d, "BCM4349B1"   },      /* 002.002.013 */
>         { 0x420e, "BCM4349B1"   },      /* 002.002.014 */
>
> ---
> base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
> change-id: 20260717-bcm4356a3-bt-cd78cc0f42e8

We need some more information, such as:

    Test log:

      Bluetooth: hci0: BCM: chip id 206
      Bluetooth: hci0: BCM: features 0x0f
      Bluetooth: hci0: BCM4384B0
      Bluetooth: hci0: BCM4384B0 (002.001.025) build 0000
      Bluetooth: hci0: BCM4384B0 'brcm/BCM4384B0.hcd' Patch
      Bluetooth: hci0: BCM: features 0x0f
      Bluetooth: hci0: BCM4384B0 AP6684P CN iPA [Version: 1030.1021]
      Bluetooth: hci0: BCM4384B0 (002.001.025) build 1021
      Bluetooth: hci0: BCM: Using default device address (43:84:b0:00:76:93=
)


> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>
>
>


--=20
Luiz Augusto von Dentz
