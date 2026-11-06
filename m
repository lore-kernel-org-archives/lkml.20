Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974761;
	b=WU2kBCUq25oHRlZjj/f451dHMJG2FMf37feOcDMEV/ZUetpT8tmdQ9ILAoxfVdoMvOHJ
	 roK9tlCk6XSpD4EHCtDF8SHuU7HTkklpYlvKmlpFmpYlj2RT1ZCY/nB56mKYNLM8zhWQf
	 xM/5XX6trJZVA51I7pjs1pj9mk6aP5Q/ziEWUgZWXX/mWPLuM+1Tbsc4JnXclciwZgXTs
	 N5cSCufTtrUx2lA5xjB4DZ3M1zVUH+k0KYVkXbQwNOvTozMR8wVzHVYAo0uWPhRnBq2QJ
	 p8VFsEdGpuG7gnHPkHcdjiKzoY9Kmre+rY4ikMeRVvf+rFv70b5sgY+Spj1b6+Mi4sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974761;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=FImo0Si6aBUJrvKYxmacsgGaoJNjRjIi7dZYfg0r/e4=;
	b=iHaFa6cq4CsxBLV3c8C7xSLszoo3l4TCJyBjTYp4zmNODm4DLjuCjOujhoJU2V0ApMR3
	 2tJYoKtSYESNSutP/lZgu5r6+/2x0Gq7VnXJioNarFymE75fTVZpKubKELf2MuJme8x5U
	 G4QCYH0KvlrVE8T28ZJzpgitv443FK34e46bo9ErS7BheZqtOV3Ev0sbHrj9uX/8BoqHI
	 TfFw/dweWEYWgEcwXkOgnrIVfj90uElR9A4LLKAWC0PmqKhplrGl28FV/dO9UJDVLbxUb
	 2Kaz4XPwwOv07rEHZPBnT477fwRsOycB0LKc4NdpgMkSjGk4H5yDVRSH5UboFV9R8Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hJfA1aDk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0872606A33C;
	Fri,  6 Nov 2026 14:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hJfA1aDk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72411F0089F;
	Fri,  6 Nov 2026 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974760;
	bh=FImo0Si6aBUJrvKYxmacsgGaoJNjRjIi7dZYfg0r/e4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hJfA1aDkwM9ReyQLQZP8cqOlSvy1h87gvRMqTjepz3+KDmLSXJgdKFLkiEnThBUNQ
	 yFrOdWj+FKJFL0F/ytYXlbcnN/Ld64cYCLhgfaL9oBZoWc8HCo5nNLGIUjWYkEkpMx
	 g46iqqpmAfudUA2pifkLwrjRj9wMTORA2uH+1Eq3xuQdbmBDxSNJpUgKr/gjvieTLs
	 FkeQghztvAnUBtiJfs7WGCstiOgV3VhrfWw4TW6cJHLF9mrtQ6nygNu7JmN0CebAnr
	 Jw+/WTFqBWcwE44AwiPzuaggypRfN4BcXdg0Aee2xHn8fitBKR/hfz/9d+KPEftIKO
	 ysTXRijEJpeCQ==
Date: Fri, 6 Nov 2026 14:19:16 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] ARM: dts: arm: Another batch of warning fixes
Message-ID: <20261106-wise-ochre-lionfish-25efc4@sudeepholla>
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
 <20261106-outstanding-turtle-of-opportunity-9fafcb@sudeepholla>
 <CAD++jLmYJM3VhKN00CjpRviQ4Zfr394c2o3xqZPqEZnq9yz-ig@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmYJM3VhKN00CjpRviQ4Zfr394c2o3xqZPqEZnq9yz-ig@mail.gmail.com>

On Fri, Nov 06, 2026 at 02:41:20PM +0100, Linus Walleij wrote:
> On Fri, Nov 6, 2026 at 12:03 PM Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > We can remove vexpress-v2f-1xv7-ca53x2.dts because it is highly outdated and
> > relies on an FPGA tile setup. Replicating this environment is likely
> > impossible since the original bitmap files may no longer be available
> > easily.
> (...)
> > > Rob Herring (Arm) (7):
> > >       dt-bindings: arm: vexpress-sysreg: Add "mcc" child node
> >
> > I assume you will take the DT bindings via your tree.
> 
> Me too.
> 
> > Linus,
> >
> > Do you want to take this series via your tree or prefer me to take it ?
> 
> I think it's better if you do it because it seems you got thinking
> you want to delete some files, so then it's better if you
> queue all that in one go when you got track of it.
> 

Sorry for incomplete information earlier, I was actually referring to
Arnd's deprecation of few old ARM platform support series which removes
MPS2.

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20260914140821.1805449-1-arnd@kernel.org/
