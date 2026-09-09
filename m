Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472A62EB874;
	Wed,  9 Sep 2026 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970119; cv=none; b=rqRovNQ6y4WNYfT3eceqC/XHNOJUcdoPG6XNR6/6q7q7vpot1TfzmGVTNDqmNl7W/plbzNK46Pl47qh9QkUFqq1yCTTRM2sG3uo/3xJ6lICAzFEuPf21AHs5FuMu14gwF6cBbRh6vQ3Sy3DPIcWnwnG77JG/+GXlW1uNtzpDe/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970119; c=relaxed/simple;
	bh=P/KHFVti0ofU1bTEXsRo6PE505HMsU3bed4Z8Ut2R2U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Z2Hy1ptuW7gf4X8oCy8RofqP593Au7PWZFXn30mBLBD+MSpWktme+WnXYlxY1wfOZ1odemEMYL3mgYKYsSnsLDSZ/tZu3BeJUxRqN96oTeePmQf8us6Yx5/NG9rLmRPRo4rJg1a1rYUM1zJJodzBbfzxNF17kzMUqgdoRY2Z0lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oq/fwZZu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oq/fwZZu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C061F00A3A;
	Wed,  9 Sep 2026 16:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788970117;
	bh=6NH5mLrU6BvUSnSyimWpXSc82eold5u5a485g8bBJCI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Oq/fwZZuubT0CrhFPi0aqoBtpFJHp6Pg2ODfOqYwr1iTCa57l30SIv/dg0lHX4nfR
	 twkjG3sC2JwMYYL26Pr77uwGO6LUI01Bt5IIqgGouw3G3ytXdNSdiQ5KIixWjMZIZm
	 BfDDSQMj/Nr0IC3bVe+8C2iA+fRh2rB7OD6Sz0amuyLs6Bc0uE+trPCkCkInX6kGod
	 0tyS5XqzSD/FEq5s69M+rwxZBPEgCfZO5vW5h7qEBnkBk77IHPnb+VfHl5+SGHaSLF
	 XC06dk4vq68StU2frayC9yHjgpkR8c1X8JRrZuWISBL9HMaUVlMXrUQy5SGoKl4H7Z
	 I9O8U0J8/91sQ==
From: Lee Jones <lee@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Simon Trimmer <simont@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>, 
 Hemanth Selam <hemanth.selam@gmail.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260907045331.16932-4-hemanth.selam@gmail.com>
References: <20260907045331.16932-4-hemanth.selam@gmail.com>
Subject: Re: (subset) [PATCH v2 3/3] mfd: wm831x: Fix typo "convertor" in
 comment
Message-Id: <178897011465.608425.7712375857842172149.b4-ty@b4>
Date: Wed, 09 Sep 2026 17:08:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 07 Sep 2026 10:23:31 +0530, Hemanth Selam wrote:
> Correct "convertor" to "converter", reported by scripts/checkpatch.pl
> using the misspelling list in scripts/spelling.txt.  Only touches a
> comment, no code changes.
> 
> Since v1 the subject carries the driver name and a capitalised
> description, to match the MFD subsystem convention.
> 
> [...]

Applied, thanks!

[3/3] mfd: wm831x: Fix typo "convertor" in comment
      commit: 6b59fafe285338afd1dabbefc9732cfc7de23ece

--
Lee Jones [李琼斯]

