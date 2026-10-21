Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579094;
	b=LlKeGTwexSGgez2XrIly9x2US4bpG25Ljs8TbIIQ12+3JaeK0XXzGNfuuKF4pYhjLqxk
	 zLdxFBVUgvuyLjngYQwfU0D+M5Ea9WTOl+4U/YKS4/jdVh0DrcTLitBVKvkQWYRTFzBzo
	 jBp2KOsFz13m78sjPvNsy/PtYOFd/ZBMIAVsbHyABbn+eBK7Qz4Oha7PWiWnM7t1g3Aw4
	 knePcZPFJ9na6gVFEnrn7L9WApiC0VlSVvTZz8VveGOTtZh0hUKJqDBo3KUEqbNG6YY9H
	 +6+CEtFh7iYMXzIDB9ABYH4aVIozRlolBZaf7pnQOQDw9h2Uj3mimPgDTNcS2xusFfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579094;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=YwmUvHkGTa//vS4IwVUPfkvfm6qtdCHeRkio5ziEENg=;
	b=j6Zhv8v+TkSdXXMdxw4q/P4lfxvSPhzFLhG2VgsgJLTGfieefvDPmQPeqiHl+Wbtzhpn
	 xnnSRFpO2EzWQrFtZIviIut37EX7wyS04AoGQnWQZrBJBEvJsUipr3lPvIyMdVlR4j++d
	 txuu4p0p2MROsSdiruTW2ZyeyNXdGL1zpCcQLK9TY8QMqeM+FUQcR7eyHdf4iYXkr3BVw
	 9pK9X8dAhWAolG6n1Ca1krv7cTdTEe6P5r2XJbIn50v6Oix+rIV76hRBfCyqSWG++HBiu
	 QCDzfJX2H0lxH9D6oe8+4RHTfwQ/D9uyE61EBm9rzoxYt/yo22TgbUSzTn5fNWpo6JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.54
Received: from mta0.migadu.com (out-54.mta0.migadu.com [91.218.175.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4777606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4777606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YwmUvHkGTa//vS4IwVUPfkvfm6qtdCHeRkio5ziEENg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792579089; v=1; x=1793183889;
 b=RapDFibNpWNf+Mb/NuhftYhpHTgnsTxO+4ApAwi86P+bHIWyGixdtUSgFUOEDe42XqZ6+bUG
 LvoNWchmbGMsRXw14Ql/lcWXe9CF376faC8NjG8MPAZyL4oyZzrqEEqQQFN+DFg46kdpZLZRRlh
 rLjF0sdHIqTIRFB02aA/O/Nk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c9ca0b03b8d94fa6;
	Wed, 21 Oct 2026 10:38:09 +0000
X-Mizu-Trace-ID: c9ca0b03b8d94fa6
X-Migadu-Flow: FLOW_OUT
From: Igor Korotin <igor.korotin@linux.dev>
To: =?utf-8?q?Nicol=C3=A1s?= Antinori <nico.antinori.7@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Boqun Feng <boqun@kernel.org>, Brigham Campbell <me@brighamcampbell.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Gary Guo <gary@garyguo.net>,
 Jori Koolstra <jkoolstra@xs4all.nl>, Miguel Ojeda <ojeda@kernel.org>,
 Onur =?utf-8?q?=C3=96zkan?= <work@onurozkan.dev>,
 Shuah Khan <skhan@linuxfoundation.org>, Tamir Duberstein <tamird@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject:
 Re: [PATCH] rust: i2c: remove TryFrom<&Device> implementation for &I2cClient
Date: Wed, 21 Oct 2026 11:38:07 +0100
Message-ID: <179257908750.11105.893364071829221111@linux.dev>
In-Reply-To: <20261019152329.620610-1-nico.antinori.7@gmail.com>
References: <20261019152329.620610-1-nico.antinori.7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Nicolás,

Checked -- confirmed no other users in the tree, and the Fixes tag is
correct. Agreed removal is the right call here over a lifetime fix,
given the new driver model has no use for this upcast anyway.

Acked-by: Igor Korotin <igor.korotin@linux.dev>

I'll take this through rust-i2c-next.

Cheers
Igor
