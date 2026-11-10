Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320378;
	b=5HDou71luFdNSop1c/rVPb9mYoTnTFVUbLdd2f2bgT74j3lWJWt13l3U3RREdfIUi+l6
	 0vTCNohRUkozFP3R6MXcro/VRjSBQMa+iP7cYXDdckx7UYCiX26v4gPk6rcBK+emfChWP
	 WZ59g7BJEtI9e9PI++1v11Wk8n81qvHjtwT6BHBH8U+whpznLg669pXp81hfSp6qtlvjh
	 wafpiKa+1WE3XK0iO9Dct1Ku3pDY7+gVkYnzsxogKe2cPuwjwadvQHL2sIBstZCnNTOPU
	 LjKKkSIZNfgGeoNdkVvbzx0PWZ77uTRzpIbZIfXEJSCfClWJJddSQ+rOEUuohOb0XiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=KgPlI63d36dkLxx70A6MO8tl7h14r+OFtgotkLmdmn4=;
	b=sa+AwAVTEldc6vMDr9Fhdg0GRYUyrwblrzwgRQ2f+YQbOefIDGunTY7uLSPgNR/etHb4
	 OO725oPqIWAPjeO3E5HCOo6HaWiQpxaJRblRYxWRsmn3e9Ff5fBN6g4WZYr4fwgZgOl2d
	 OhQDMgJ1bdFn+DybIPgu4o//HgN+5k7uEISn8Ud7BZQTS/S0bFNVmAQVwBb7vbWF+mRny
	 7cTVpfANi7S7RasMqIsgwfD6ldZM+eixqbK/4AqZC79uNQA2Wh2mgHXGQamHkReR7k3fv
	 D0u0JuMgTUAIukhJRsiHUkJJvkZXgTQ+yCnUfFZxikjJdkrgMdZm3fDAZ97xq4HFsRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cb5rpQ0S;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F17660A2629
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F17660A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cb5rpQ0S
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3720addb068so3648616eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794320377; x=1794925177; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KgPlI63d36dkLxx70A6MO8tl7h14r+OFtgotkLmdmn4=;
        b=Cb5rpQ0SFbtE7iVU5JJrjmydsGk7fQZauZJUDx/CyNH+pJsYAimE8OZSEEKzT7mbFa
         BkBlXzp357MuT8HOEY+f1MmwQIAMGvzs9ADhkjTP+7AQzStaPUoa/Si/omQkovNWnZe1
         EO43/NjZJAmwyAoorZgIHLGI0GmzemVCRzQtOoo8SVBfpMnUAfE9FjDCmn/fkZFuVICR
         RjdprPYrAcq19eVR1I/8Y5vFRg5YhDuQV9i2faQy0HeOS6mxyF/zJDrQxIDyYN8yppb9
         iozLnV9ajlgDuO6ydVuz2CHNbB1DYVrBFgP1leLeULzZ8Hog2IMLowDrG32rkYtOwC6P
         R1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320377; x=1794925177;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KgPlI63d36dkLxx70A6MO8tl7h14r+OFtgotkLmdmn4=;
        b=njAnva2MUXa1gyNTa5bK/Bm5CwW53eUkuZmEIQ6sWwsxP/D3jJHys5+NRQF3Gm5O9d
         5rGHIVgfGTP9HG2AkQShaJC73/fB++tnfmXrJzadSc8C3xnr7RV5EROaQdSJFZ73vXwT
         JYSVCG+TgkGkSpXggZbEM5ve5LepovEf51kGas67YqVuGLMAylfdqCJshoyQYsESSYL9
         YIQXSnMKcr2EynZB32ZC2f/i49pAfse6l1ldU8kj8W7jhegCzuhlXsAqrFW2MaENyYED
         Ztb2eZniTsBg+fzsg/PidLGbwFMtFV2MykUx4DThmxBWt3ixYb1DI/yvHmOmRAqWUHAS
         QlkA==
X-Forwarded-Encrypted: i=1; AL+hErHnluIKHtRh1yJyWwfA0yz8GHWm+tFrnnbkVng1K8BXvSPlUP1Nw1I6yYzivnM4J/I5zuScrQl/sa8Uf94=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DRBo7iwxMv8dtjJ4/Ew9mgOJKfzLf5QEKl83lpbrYzZY7Ny7G
	HxDg+x+Uy0xHC6GtBWkk9Iy0WsoRbYxXC4Pa3tCOn9t0YuM5hmk9Qq4=
X-Gm-Gg: AYBFou24WlIb0u34u7XEo1bKL5PGBjUNFCpyPbnrhaMv2/qxzjK/aKa5OTWPW60uqTX
	9WY4hNdUaBnc93oXsqIZTZEzVVYXqvKuDAqMZ+0iS9Rv7CyHeyufGcOgNq3yyevY/WS3WV6XNVd
	R6jC1OAjQlGc+Hz+W97XKgR9uuvGMft+2CYmXaxY2FxdUhoiDRRRGQrfdTOFSH6U2m9khvfktLH
	zKptPiD5URbGfO11yHtGZTnwZ+iWPHCsnAy9F1EQJD+lDjfofa4kCdx17eQ6IX2G+x759lHc9pG
	+DhEzUXytkgLQAOb/KfCbjolJgP0j6vbmpcLbia0TBtBN2rqy/r7QNkrtHr+QkyIKlhCBhyBzNk
	SKRTIBa9P/k42jagT1zUq4d6ORscpYdLM+yPjU3fHc6T2vUNQtj2/57xOgFyKTpO6Gr6OEx0s6O
	C1OlYA66K+asYtG39VuqLXumPCTNdubpGeViLMAn7wH7AkIDnBS0DcJcF5vSEQYgpys7qtQH2ow
	O0sujTLIsP1QfLj0nMxpRBVNVqr1bncbRQNuGlz7wh7hVXBW6DmSh324ooCuhjaddCU28Vqc1GG
	9imdIfa9T5F/bylAtl4IMuR+SHbYfO0w1Hm5R+OGmUcPCWGOqup57GaQZ7IMZKQjChbAqqJSkCM
	1eXJI0Z7faA==
X-Received: by 2002:a05:7300:cf91:b0:36a:15ee:c20e with SMTP id 5a478bee46e88-375212ea575mr3560699eec.33.1794320377066;
        Tue, 10 Nov 2026 06:19:37 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c863csm7225373eec.28.2026.11.10.06.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:19:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 11:19:32 -0300
Message-Id: <DMRLHJFMIIJF.1B1Z21J2B2J7R@gmail.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Benno Lossin" <lossin@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Brendan Higgins"
 <brendan.higgins@linux.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Gow" <david@davidgow.net>, "Gary Guo" <gary@garyguo.net>, "Miguel
 Ojeda" <ojeda@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Burak Emir" <burak.emir@gmail.com>, "Rae Moar"
 <raemoar63@gmail.com>, "Tamir Duberstein" <tamird@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>,
 <kunit-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] rust: bitmap: kunit: uncomment
 owned_bitmap_out_of_bounds panic case
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-3-5ce551efc48e@gmail.com>
 <CANiq72ma7GrbeMjktpWzNwWYj5y+AsQk8NROKY6TMdk3fwXEgA@mail.gmail.com>
 <DMRKVJYRSG2B.2LT5AVK5FQ52G@gmail.com>
 <CANiq72ntU+K7JX126f3fhvW2ofK6yNDEn0RkE=r25To3cDaRMg@mail.gmail.com>
In-Reply-To: <CANiq72ntU+K7JX126f3fhvW2ofK6yNDEn0RkE=r25To3cDaRMg@mail.gmail.com>

On Tue Nov 10, 2026 at 11:01 AM -03, Miguel Ojeda wrote:
> On Tue, Nov 10, 2026 at 2:50=E2=80=AFPM Nicol=C3=A1s Antinori
> <nico.antinori.7@gmail.com> wrote:
>>
>> Yes! it was to match the other one. Since there are more tests the other
>> way (#[test] on top) I can change the one I am uncommenting! (kunit.rs
>> have also the #[test] attributes on top where a #[cfg(..)] is present).
>
> Yeah, then let's use the existing convention -- that other change can
> be done in a separate patch if someone wants to do it.
>
>> It was on purpose, I thought it looked tidier separating it (but it is
>> just personal taste :P, gonna revert this in the v3)
>
> So we generally try to avoid those unrelated changes, though sometimes
> it is just easier to do in the same patch.
>
> However, I was asking because that removed the line (and you say here
> "separating") while later you instead keep it in
> `owned_bitmap_out_of_bounds`, so I assumed it was an unexpected
> change.

I read the change wrong, it was indeed an spurous change, sorry for the
confusion!

>
> Either way, yeah, it is best to not include unrelated changes to avoid
> confusion.
>
> Thanks!
>
> Cheers,
> Miguel

