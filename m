Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4114649B217
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862233; cv=none; b=HPwvQLTU0/nUGtrL5T60yGzxN8pgBTNy9LO3AYAgPpUDangPxUxazicA6a6V31cE9k4BT0Lrjmn7TQmkOoP+vbmDHtOH8467B5Ppxv2Nb7ZREakNQV4dPrjq+k0xXzXJV83QyPzkQzocDtNtUzT92jWEkzqPThqmzyIRngg28f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862233; c=relaxed/simple;
	bh=YtxTa1VgrUAUHV74VfDLuMxfbVAqObQYg4zUaDxY7zM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=qs9+X0vPrkwzE8t0ib2Cun73WZLq7e4pe9sIzaG/jQqIKYU8BhmnW6rsZRex2kFfP63+7FKyvygJGpShQIX2/lbSttfXifD+TAZta9AbZzbIPFPxiXdr7H+RmlXIqXBD+HUvweX+ktZwzuEI0y7dacDOb8H9j11tdxsMFGug8mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VO8F8gxJ; arc=none smtp.client-ip=74.125.224.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VO8F8gxJ"
Received: by mail-yx2-f39.google.com with SMTP id 00721157ae682-8acdb1ddd96so9922167b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790862228; x=1791467028; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YtxTa1VgrUAUHV74VfDLuMxfbVAqObQYg4zUaDxY7zM=;
        b=VO8F8gxJeZ7wLqYG+Xjib+qHJW/Y6FBR6NNGchHrCBPwSgpBsutE2HrOmARDM2yOUP
         /bL3HhegEC8VPqdGXVeeID1kQW37rrUOubQC3l08KWDc+rbxi/6XbYK55SanMb0zS/YG
         Axre/w8xRrpZKjROzAhBzgk9TSjLNy6/dZkkWhbCNLhdj2JCYUDz8DmnRKLmwzzjTEtc
         c2raAbCRf3Li8LribjC2XXd2/ycfEb39fgsoeTiR0VUKiZFl8pRGNrKL7G7K/mYxLPPt
         ijfpp+XTN8sweFUABZgI4t+Cb2kDen6obENTbXWm0WkRKpFbWzOrhXW8QLe2V834J1HI
         LqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862228; x=1791467028;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtxTa1VgrUAUHV74VfDLuMxfbVAqObQYg4zUaDxY7zM=;
        b=uLxboVuKhJaZbGdTsNukCOJ8e5kLQow2yOv1ZvVpJLXzcjLAJ3tT2LKS1LeiClpyPj
         R6KD4Fw0GeSgW2rUL3Jg+4Njx4NjL2Kok6g++izH/XRMUIn9f96W2j6IH+4TZg3nP+p7
         GZu5shMm39h5dFKWu835zAn4Dvv+CPtOVxyUALrgjclz2t5zNC0i+MJes9gPH5j2k2u+
         luFB/gE/HJRAZh1reLUVU6j7zVFFKbBYekFnlllAdimLnCR28TAKKgwkCpGBosbzSWok
         juD9urZQ4PadZD2oTJXSd/8vGDqImKkK8knxDZ/NtJM7r/ibgp/i+2HC7lEL5YW/eeY5
         /x0A==
X-Forwarded-Encrypted: i=1; AKwUvBySt8yl4fCK4sqxTdaudDophxbSe9Shg8PFOJ2G4wJZ1bRqFSu9hPMeJMa4van4NTYF9phPrqdJ6esFuOU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdLldm4G6HuXBwwYTGcQEjvJMI5k8WVDer148SnMANJ1E3OH93
	IhjedmKHQsVzKgcyPsTpMgOV2ch8dMQ3evPGzSeBl5jrh/FO+PlNqOc=
X-Gm-Gg: AYBFou2mdvXUB/HaDfsI0dP5FHjYvrXe/xOWy95ePYjjulwbuPtMmA8Jez+sxrqoxyX
	ZrjHIET4FcnrbhIA65u/9/SHPOiVWaAk+bxTc4SZFHDeeGWcAelRNF888fZWDLgrOTo7/p2Mkua
	cVTdhHDA4PWwbXTIb1wufqOIsqMG2jBaG6eAtnBW6fFrcjs+5ascRGo/H8P1KtgogNA1Ql3G2t0
	ZqkeY9+tg63Nl2dNwV1TT/rODXH14+rX68HZKQaEon1Bju6V5j6gN9Gd+KpLHBtTENdTHPag9vi
	sRMGYF1JB54cgCLc1bvTSh+13wgonjGKgockKe9/en2rf6bfNguHFZmb9DpCRCwdwcHkd0W3oxh
	gxLQ+ybO5HDfpFdG20wv0ggJ0Ww2YzDQF3Jq6H4PJSyodlbTgYeAGpV4zb21rYq8ei9yj+LTIMT
	gYaUIMGbY388EykDhMuJqYVwiSs8QVHtP6hWzza1byQffHNynNRfTa54FQ6En7kQtsoV3bq/Zsb
	0OkY4T4JKrj9T+g+CpKkRWfvVPs10XB3rVrb84896Tx
X-Received: by 2002:a05:690c:c353:b0:8a9:a268:d719 with SMTP id 00721157ae682-8ac93fe3e62mr20075197b3.66.1790862228362;
        Thu, 01 Oct 2026 06:43:48 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8acdaceb3f6sm10232417b3.25.2026.10.01.06.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 06:43:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 10:43:41 -0300
Message-Id: <DLTJOAQSES8X.3ONDW2BU044FQ@gmail.com>
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Burak Emir"
 <burak.emir@gmail.com>, "Brendan Higgins" <brendan.higgins@linux.dev>,
 "David Gow" <david@davidgow.net>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn1_gh@protonmail.com>, "Boqun Feng"
 <boqun@kernel.org>, "Brigham Campbell" <me@brighamcampbell.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Jori Koolstra"
 <jkoolstra@xs4all.nl>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Rae Moar" <raemoar63@gmail.com>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Tamir Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Yury Norov" <yury.norov@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH 0/3] rust: kunit: support #[should_panic] and same test
 name with different #[cfg(...)]
X-Mailer: aerc 0.20.0
References: <20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com>
 <CANiq72k2RfFBncNBCGGdWFEJ-wWZ1MzA8ErrBDAcAvbGSRaS=Q@mail.gmail.com>
In-Reply-To: <CANiq72k2RfFBncNBCGGdWFEJ-wWZ1MzA8ErrBDAcAvbGSRaS=Q@mail.gmail.com>

On Wed Sep 30, 2026 at 11:41 AM -03, Miguel Ojeda wrote:
> On Wed, Sep 30, 2026 at 3:23=E2=80=AFPM Nicol=C3=A1s Antinori via B4 Rela=
y
> <devnull+nico.antinori.7.gmail.com@kernel.org> wrote:
>>
>> This patch series intends to implement two features for KUnit tests
>> written in Rust. The work is based on a TODO comment made in the
>> `bitmap.rs` module [1].
>
> I am glad it worked with `b4`! Hopefully no more Gmail issues :)

Yes! Thank you very much for the suggestion! I'll have it that as a
fallback mechanism for now on
>
> (Nit: in cases like this, I would suggest increasing tagging with
> RESEND or maybe increasing the version to avoid the same subject line
> in Lore and other clients.)

Sorry about that! I had the intention but forgot to do it

>
> Cheers,
> Miguel

