Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793624019;
	b=uH6RkKrM9W+8HMh90rUq3aRcVetCbUQg6uqCIsnPL+S+0iEv6ETVWNd1szDZzK1F40yK
	 WX4YPHzGFrvynbp+AbaUJTjad3s1UlsfkjeQtoOeVPUpCUGWeZf5oz4vm1TRko/5QwpRF
	 pZlxg4Pln36cxAgQGWT5y8RSbg33Zy+L7HLzZDOvtV1Fle2/YJ/4VAqQg0uIUlyeYBH1k
	 0J7C8ovvmZiAhkEEj3IMHWwRqp1r8HdqTivEUXZ2U2AjlVqNB6P/M0u21ctr1JO8gRkEK
	 yLSUm3TlVJxdh4yGsBtVtbmIiwDKQRFSQFL5wxHyvMAYxyBSmEoqFdRaj6iZVUVeVAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PKWzOeMbtoREvXP2uKxA/cmZW6EK1zXaCrtl6yHjImQ=;
	b=qjj3iwQmet+w1jaSyu7i8hMF6hvNnSqK/uT8jzoCQRiHIdhiQvFfcd+Ei8S/t2aMRPbf
	 B6ScCLMGRyHH/gMn5wVKVtKDxDUW9T+sFchdylyDkHDgvv2NSaP9BuxPYyCE/yyHZoIAF
	 J1kqS++0kTypSX19XNZk3QG9Faj5Nw4dr9H8dTOTCUdlF2VinTgDtZOYbcVsof66WBmT8
	 HuIgajjfrJjOU/zU6VHp6ynG9b3DB1IhSVwjE8LMEfAKYdgxgR4QoWkQGH2qlTFEuo1I7
	 nChoqXFvJ2VkXHzy3YHI6ViWM6mSnnQDK3joFIGozuhthfBlA3FsOiLETK0zjb1Qosw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="S1/YtTr2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2982606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2982606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S1/YtTr2
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ac8c03cea4so25845341fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:53:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793624017; cv=none;
        d=google.com; s=arc-20260327;
        b=ZXXhoiMb7MOeEq5yQx0KVUbXxALCRJkE3abUwBtZlR0DyNnEDfixr+JXiUo0k2NwAq
         /DzQNBYq352AIQUUDZHlYxEGJ6/sn36kqvuYaLrKQhEmBqAJh81AOLKEXCyXCu94bitD
         sQPJsBrhG2B5psyTbn+d3+zrHzqhjE+lvtIazSLuWEdP0rtpBXnfGx4r2nfr+RReIpUR
         rAweEkp3gisYDzaOzRE8fKQyICdkeN3FUy1pE1TcXNfhSw+upGZbdruQJ0gbJy1s6jov
         dlzSfltqDir7ZsVtm3cKsvUcqgmEYl6hhWQ3NavlU9e1ua60aQ+OYbyuJaPTAIOQGoOV
         cQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PKWzOeMbtoREvXP2uKxA/cmZW6EK1zXaCrtl6yHjImQ=;
        fh=/WhTy4RK6ufWegJBesCcmWa9un9H9eVPQ09peu87tm4=;
        b=EcBmB3OMGBhITaidacWoQIuGWVGEuRLUpoNqZU8DUa2sSG8uCkd5iw6iQhgMdhYq6S
         zTgzyseqsNJ07yE21FwZ0utgcxt5ccFFWhudqmH9Ni8m2Ru2vgvp1qkbfYcmfxTkOZFB
         Zwgk8SSbJfRVAtpmyvat/zKffWYvDxFQiEs688ONSp8gz2wXYbaIUxnh9buWEiPfBhgp
         ohCMJdD9gqjDrVGR92Ul497ZS2YhQ8gh0AkZtE48tJPCY2T/7WUM9EoRcppi6QDMbppn
         dlN0SFDtI8kOttSsQqONqG7B0TkvAuu8+WEf3OlcRnMSzqasQ/BX3WGReoMjsVpVHqAT
         id2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793624017; x=1794228817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PKWzOeMbtoREvXP2uKxA/cmZW6EK1zXaCrtl6yHjImQ=;
        b=S1/YtTr2MNs+kInj/pmyyuczrtxymRI6PUqq5bBq97aTGnexqibINgLL66GkAoJ1JR
         hqP12W8wA2yc4uoZcBmdGoUttyfFRC3blNxUTWSgM10xO2rCTJkhqgQLaj6yS99fF2aI
         M8BnXulzbRBmRBs7H9DKX0X5J5Q1WZxWGNmDuso/tdCFUvVk2H2S1ifbF+XCV+cVrObG
         kCT66eBMKk4kCxp+DkrWt2yNp3UOOcKjHpsl8wAbRDAENAKeUt9lsKuOd63cKp09jm9X
         tzIGiQSrbXlqEDKGliEkgGGV1bN8S2YKGxwOEk0WTY3z3LsUQ2c3rQNIQ3fTUH+dtYgx
         0AZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624017; x=1794228817;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PKWzOeMbtoREvXP2uKxA/cmZW6EK1zXaCrtl6yHjImQ=;
        b=qe+Qe/J2jeVFJoJyn69prraUvoT1JHC1OBY4XiGxzMMZYGS8294TWoVVkB/4TjXbu6
         R9EYZcfWVGj+QmVQmlai1/jP7cX7nihrDZs9j/S9EedHUJolok+QI+IlkJ2wuv+6QqpC
         f39OQAL91k9EK4Ktdl2wW13y2fzcVcyrxax6f488GTqDpEEI0awyRzxHjAt3rO8I6XyL
         mp9xzMLkmazh8urCfKutfFCwnhY6h5D0r9P3bvm052Fl/oB8mrLAcqaIXdvnFgfubHGi
         eug2WVt+owt24Hv/NN8aBXaRZC4n+gBxg9ZMve8+LtYTM3ML1R8cdfajkDLV+M1Bddbc
         cIfA==
X-Forwarded-Encrypted: i=1; AKwUvByMqnhcbu7rsFuPUr4kzHM2Ys8ZSW2m55X++kaVI79bVbuGa5R5ccQugYtqRTiik0cfn42JRu3LH4uB4+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RJgec1BDTdzlTljVpmg+cEtXIo4XC97PNR7pe96dmS68voh9n
	M2Ouo8uePWO0UBzanuaOuJI9Thk7L9S1jCEQAS85PF7NKoonserMDLHf22A20nYy2xG+jwrhkb1
	vAOelZrr5jkoesHARPMTpj0f2kJxR/t8=
X-Gm-Gg: AYBFou0AaXHEApLbbNonnxhJ3tQSjhkt4W0kDKXNqLqPoklW9On3k0VuaVxQHKvDuP5
	qIqHC1kOg+wRwcOJw1xIJ/mKjnrv79i9UGNJIsqqFTCAJ28/GmdFjnLzWeGgXe3mz3npwbPsy1P
	qBKRbh4lrZMV8rrNQh/566GZffQuyuYGf6qa4az/wmu2beTFe2NZ1R5ilWXE7HAgCOmaPoJSaMB
	cBLLUirmf6cJtA31sMa9uMVuBLP3KoXasNnQjM/InKtEua+b00/AA/dgCjv8wMbVcF5zQtRJpIz
	ff+EH9AxoK7Qu7JSD2QVJ68YEFt3Zn1BxLP9RmOabxJaSloi0AfkFu8C4lyRKIAVWqzsqXD0Iw4
	l0bjnxvME28pbz9KlPYPw9KH95ggdAaCnHuoGtw==
X-Received: by 2002:a05:6512:3d0c:b0:5bf:b5bf:e92f with SMTP id
 2adb3069b0e04-5bfd9560681mr3075383e87.20.1793624016687; Mon, 02 Nov 2026
 04:53:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102120929.4077030-1-anilkaushikwireless@gmail.com> <179362163558.3286.5335895869912806815@kernel.org>
In-Reply-To: <179362163558.3286.5335895869912806815@kernel.org>
From: Anil Kaushik <anilkaushikwireless@gmail.com>
Date: Mon, 2 Nov 2026 18:23:25 +0530
X-Gm-Features: AclHuK9PyreJTBljW7ZzmF0xOz3S8xl5coCWXAIofZgHiGIZruf3wtHbRZ4qAYU
Message-ID: <CAG0Mgm9t=ag05xgP8f0++x0sNG6nOt9zDWbtoKLtgnhnpgm3Dw@mail.gmail.com>
Subject: Re: [PATCH net] netlink: Do not call the unbind callback with the
 table locked
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Nicolas Dichtel <nicolas.dichtel@6wind.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 5:43=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

Found by Sashiko, not seen in production. I triggered the hang in a
VM, with a test-only msleep() to widen the window. It does not hang
with this patch.

Regards
Anil
