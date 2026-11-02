Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793592102;
	b=Ul/s914fCP0fBMIXdJH5ns7+u/T0fw8CHVkP9Sy1ouV4cPwSx5usfd0G0AI6XXudgzNS
	 4nxxgNBLcMXW6OVnHJARtDagBYe1HUuxG+Bh+BDQTZOsf/5dGcJ37vY5sb9MbJL8ydzQV
	 o4gS6oOqRw7DqfIJ9f1KFEbErjDBwNe9PSeuQNHP7yNTCveJpQj9r8qVfkgyWSazz12PN
	 /r+K9BBUN6/LzBz1yPjOZ3E0cLzXfHvoOpN34VO4PH3cGqPgoXqqKILJ4yU4UjD1kATW3
	 759XqmFFhb5/kPLgZeLAgA6ndH/j38ouTJv9G+g4LInDRqR8HoKbJFOYY2n14lPba7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793592102;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=rJsujGhmIfg0M1nfxpz1FUwugLAGgTizQiw8oL16hBk=;
	b=H/9XdoFpu8gTUBIC4p7cUegqzYaOhlVFK3J9eOsejt3cxRvL1J09Sp+oXQVHR5yvaXPg
	 QFhy9r3ZMxUQ2uWEanXALZipOv3tR+v+kzp7HTuVBzb1MwRw6C3roFX7jO2qVNYvdjA1l
	 v/TqNKuZGvexmIc0OUkzU2TMgovJ1hqnB5H+P+c2l7LEUwHOoNmG9RDNbDHbdAT0uzYY7
	 5oImwrstXpIdQ9IEsCBxqFcbzSDtoT033vRXyjbbN4rXIZcgXMRYDVPke8VhjPwRv3wrd
	 gEtXhwQ3VbaYLlgzn1N5daC2hW2mmTALdY+KApXmrOJZ9ilXYH0/Vi7dbi3gwkvQLtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FpEdMx2I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F93606A324;
	Mon,  2 Nov 2026 04:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FpEdMx2I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20F81F00A16;
	Mon,  2 Nov 2026 04:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793592101;
	bh=rJsujGhmIfg0M1nfxpz1FUwugLAGgTizQiw8oL16hBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FpEdMx2I5+ceu7sBQZLB/B0VWWshjKrDfstmqz7xC22h6jYnF05dMMZMWuyBLp9hm
	 dKwtS75saOboZ1YXZv1LBfXwOqQ9CfvnnfK6+AwyavQRsofVSqazBAPQ11MqKxOTCx
	 kheG78D6ucGp0iz6ETMoBgpfHDEYuSph30E3XUUnaaYisJZ2h8Byz7ljM/NkNm5SrW
	 HhgGt2/DGavTHCP+aPDjmCLWuhS2gUEsMd0d0Cl5eI3bXF8tCRjr5FlQWPnL6HTLyN
	 AqavkpFFTUXL7U+hzUHZcForUcyMXs7Ha/MO2fjTcu019JWdfqIFAVR/nwHKcuP8IF
	 LlDLbT/GMQZtQ==
Date: Mon, 2 Nov 2026 04:01:38 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Satyam Gupta <sgsatyam@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	Scott Collyer <scollyer@google.com>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/7] platform/chrome: cros_ec_sensorhub: Timestamp
 wrap and drift filter fixes
Message-ID: <augLIhP4jcY1CCf0@google.com>
References: <20261029092846.1567475-1-sgsatyam@google.com>
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
In-Reply-To: <20261029092846.1567475-1-sgsatyam@google.com>

On Thu, Oct 29, 2026 at 09:28:39AM +0000, Satyam Gupta wrote:
> This series fixes how the 32-bit EC timestamps are unwrapped, and
> several issues in the filter that converts them to the AP timebase. They
> caused sensor timestamps to be off by a whole overflow period (about 71.6
> minutes) after long gaps such as suspend, Out Of Order (OOO) timestamps,
> and large gaps between sensor samples during batching.
> 
> Patches 1 and 2 handle the EC timestamp wrap across long gaps. Patch 3
> fixes an off-by-one in the filter history shift. Patches 4 to 6 make the
> drift estimate robust to interrupt jitter and to switches between
> streaming and batching. Patch 7 drops samples whose timestamp goes
> backward instead of re-timing them.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/7] platform/chrome: cros_ec_sensorhub: Unwrap sample TS relative to FIFO TS
      commit: 5d4991976df243d2880e06424c0c91fa05b403d8
[2/7] platform/chrome: cros_ec_sensorhub: Reset TS filter on EC/AP time mismatch
      commit: f2d353ccd15d5b12aaffab63539954c8a2a5898e
[3/7] platform/chrome: cros_ec_sensorhub: Fix TS filter history shift index
      commit: 19bc5f68e08b6ccaa3682808e46933784db577c9
[4/7] platform/chrome: cros_ec_sensorhub: Clamp clock drift slope to MAX_DRIFT_PPM
      commit: 3c127f4fa7b40ebc8a0777f55f1bd992a3668968
[5/7] platform/chrome: cros_ec_sensorhub: Reset TS filter on ODR or mode changes
      commit: 2c6a906d46fbd1f2e4a841e6ccf26b2e531fc6d5
[6/7] platform/chrome: cros_ec_sensorhub: Increase TS_HISTORY_BORED_US to 2s
      commit: 8ecd9cc825eb111b60372a990217cfaaa1f453ac
[7/7] platform/chrome: cros_ec_sensorhub: Drop sensor samples with past timestamps
      commit: f19a0c420750d232fdd4b91848f0e12a2911fa53

Thanks!
