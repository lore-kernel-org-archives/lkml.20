Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794104879;
	b=MkOjWuXACE/eYaAKZjWHS3KnUwhO7SjC4cdrvYafKBxzsReG5hVSh/Ktu2AKju3hwomI
	 aqZiXcoq8d2OTlKkaxepANW0hyivEfhjiy167qrzWL57ctXdI57rLIug2/4asK5ZMhdIG
	 rlBwvgL9Qix3Gm7D8+0B0zOxkCHeVyUTG3wrfsAJ/3DqDgEIlA5WkXmf+g+qLZmGi2lcp
	 gWRbdZgqVXnOHVvLIRNJkT6znK9QfpzRHET2WKplEaWUsNm4pq6zToQS+lp0m1wB+8Vog
	 Iq3mEfkm2Bw7gLevZXzT3nYemiUPm5GAa9m8jxsQdEjYODXrdz6gipo+823AszFuqDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794104879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CgFyMsoiKO2B1HX2AvfFumGFOpktUiaDt0kSWOji51M=;
	b=EQqlSxJKNf3reiiTcdFe/IH3+DNtQXwHS34+mEFC1GbSiXuwm8xtQsLEys4l+X0LFoxP
	 QeQ6x+nASPNaohckqNiAz5TEtG3/wutYPFGkLuE04Z3zSVRUczFRtqME3Y+s9GTDJpDtU
	 yiNvheoXER1CSYr7kCGhi/+6NQ6G9bFt37ALpVHqJdxdLp+IMRnbr/NM2AMxj/OWpJCF8
	 i27fUtfGXtljJAmGRwaB6LRV/FUi24RBraPKLZ8g7TmlFOQwbhFZsp1Ef78cfQmr9AcDG
	 7bLrUI36MqPsY2RPJDkwcr1VLiVcwlGXAVp/nxtZh5a405AhWpIox8AZEVsU2gCn7mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Crtt9KFl;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA16F606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA16F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Crtt9KFl
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-170135e43c7so146706c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 18:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794104878; x=1794709678; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CgFyMsoiKO2B1HX2AvfFumGFOpktUiaDt0kSWOji51M=;
        b=Crtt9KFlMLRjcguZk1VYPvhTgDNZMElzf0tf141OxRDD0nRpz/y1O2me5bx5zPEHRw
         DOcFer5e04/3lH3hXFl06ApuJDKLG77CFSixsb0t6MlRt5PwYzLnVHXQt/lmhfJSUCov
         8/IoZwOneMKYGudlQKvHL0tGwwIWFHD5bmHdaSx2Aca7D6KfUw3p0kAAsMbidPHSH9K6
         Vtd7DUJBiDizA1z7P9/HbJj4YxUHaR6Y20nKVwijj6Y8lmutdnjW1IMT8sE8avgxaW3d
         2oCXfkkFNdLeVsQOzUyKG8TFQRCGvgtR9ixvehQM1zvDECpHHm1ePN1spXa/oKXtzuE9
         +A7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794104878; x=1794709678;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgFyMsoiKO2B1HX2AvfFumGFOpktUiaDt0kSWOji51M=;
        b=vkETI+fNjmGhs0N1KMxwX7lbmI1XLi1675mELLsOfCVO7PiupipYIqb3P/z33wzgGn
         EIf5qbRb/3B9VzNOeQXgbZu163nvXGezjQ83ed/qeWfntywZZ1RaRDdIjA7Gph4RxnHe
         kFedEJW1p+PweQCIgvBYCB7dOoyv4u5Qp5p/nwjw11Dqgggn+Yr6Irm8ieDE4n+Esd61
         i4kwrFFDwmhjLuEUdyVNEqj5FTpa0XCUT1Yy7Be2XnNz200S/pXO0Z8akntfLjJhipc8
         //NLwhjpJP56DyFcTHysivsabwxAsFTN5i/u7X3uWbPBVBQo7iqYt1tyDio6S/WTIXP4
         i7cw==
X-Forwarded-Encrypted: i=1; AKwUvBzcCojpOR7E65WZOyNak1eGIzGjtP0wkew+gSB8CWSO5UlIJ/clcDrlB6Bqp2TseNn0BE/U/uoqFi92yXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yCuHW4ZzHt5l2kBCqXBo3K4H7Wgg7c9QI9bzFiOBwlviirV/t
	ekgyIv81P/N7J5NpHcJtsF4yPmY3HA4L/EE3mKEqEOvbfz+nWyvwIYp/
X-Gm-Gg: AYBFou31/Gmqcl+DUeFr/NKjNYF/3B044JuWsdmKtvONpr2ffyEUjy/5GqGKCm0fGI5
	8cwB2fxdHnCINCbnz32fdkQQEXKYbEoosiqn8uGFA8m3Ts2t9GF6p5CTh/X07YU6rhY53dHyWkV
	ZVeQFTzG5iDdprBlVRD9mY5lIyi9QYYRKqo4NWmt1zQyvlZBS5Mk6bRCG4fMb/sZX34ofvysMI/
	CDt1WlgioSxzHIJcs9ssUZTq4vZBUicyAPgaa+UMP1Qfk/mY5eIu0gkEE1moqMHgarNXc9/zQ76
	odiTLq1sxFCnsC0T8yxxIq8I3smLPepZ/h1FxD1o5qcgdcDhUsu1nt1KwRAoYQELrydVnyHSIhV
	scSEE+RCc+DpuaUbeypvIzZnpnS1fosR/b6oDuVxxL7LaeHVTDsfNAI9Z2uMNjf17rOBvAyOXMF
	NljQiX34UHlPhCqp84dnCgQrwWtbLrmGuLtSKIbzcRvsfp6ttrYBkwvAnsFX7vVRxln8Gk5yFBN
	Op4Upmqyp/l7PQPmf+PNSYvLDdpjW1XrIC5eJgDXLfJhXUOugd4dtNnjtauT4VkJUN+pJle31Bm
	l13DNU/WSNxPmxREf1Jv
X-Received: by 2002:a05:7022:b0c6:b0:190:d0d9:3110 with SMTP id a92af1059eb24-1b39ff2dademr463410c88.45.1794104877934;
        Sat, 07 Nov 2026 18:27:57 -0800 (PST)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm2390172c88.18.2026.11.07.18.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 18:27:57 -0800 (PST)
Date: Sat, 7 Nov 2026 21:27:32 -0500
From: Kwanghoon Son <asdfkwang@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 12/12] MAINTAINERS: Add Bouffalo Lab BL808 support
Message-ID: <au_eFNCt54nlCafy@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
 <20261029-spyglass-evasion-772697094cb9@spud>
 <20261029-amuser-savior-6a6ab062f471@spud>
 <auSDJH9V31wmbrYv@debian>
 <20261030-slider-finished-360b10521e0b@spud>
 <auXQaY25XfYzxEb1@debian>
 <20261102-throng-botanical-b244058ecc37@spud>
 <auqC9jOIQTyieQUJ@debian>
 <20261106-dislike-despise-91106ac848dd@spud>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-dislike-despise-91106ac848dd@spud>

On Fri, Nov 06, 2026 at 06:00:13PM +0000, Conor Dooley wrote:
> 
> Cool. One thing that I noticed, and felt it was a bit odd actually is
> that the uarts are fed directly from the crystal oscillator. Jisheng had
> that in his original series though so I assume that's actually how the
> hardware works?

I carried over the direct crystal reference from Jisheng's series.
But will change in v2.

UART3's baud clock passes through a mux and divider. The current M1s
firmware selects the 40 MHz crystal via MM_XCLK, while the APB register
interface runs at 160 MHz.

Following your feedback, the UART node in my v2 work now describes
complete form of clock itself.
two clock inputs:

clocks = <&uart_apb>, <&uart_baud>;
clock-names = "apb", "baud";

uart_apb: clock-uart-apb {
    compatible = "fixed-clock";
    #clock-cells = <0>;
    clock-frequency = <160000000>;
};

The fixed-clock providers currently reflect the firmware settings.
I'll add proper clock-controller support before submitting the DTS.

Best regards,
kwang.
