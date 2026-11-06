Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976042;
	b=n3CGsEah4F8baTqNQ8j7CujZlnVF69tYXBaBMk+yGYnRaDzp3lQK6wCQoxLNJyamqZEO
	 l/UpUmbdOF/TjDBEywRrxz7XNVDZlH047GVKodjdii8s/ao6XGJQ7RtCpaCWNnHOARIHX
	 zOHAhdgLN3wMSCaoHfIrYRKTSWg3puZYQtNYgZJmbogYXwdhzupz3GlNlTrlkoG8J0ZmB
	 mh39BTEZVZ33C7rT8mxggUTxv5Pl9GSFCK/Vuv8KnI6n6qoxkT38CVpvzlxH8115toX0x
	 QDPFPgH8GjrX5TnY86otRoClrPnBSl8nk+ftgF6YDihMWWQWxbmXW10cxgdSDPHqGSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976042;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=MStq/D9u6Lx4oTKrqyqI051eSh/8eE2W/WbUq/37lgA=;
	b=v+mp1UqXt1o+6HkUdK1pCkSgjVBxC7zW8N9i48pcDe6gCZED6wGKKi5IgIxWjDBxeqfi
	 0oDr9ZU13FVRUw8ZcMkB4FLUnqbC2sX4QuupVXRf3VWta6FjvPIwm7Yg0h0yWpXqyO7Mu
	 3653xqdq7T0yVy33brLh9/zn3M4F7q+Xzf8Y+VuNELTh26FOiq6v2171GwW4uthHPHu4a
	 yZ76nhdzwNAUjtBFbzuZ7VWKZKTv0Q06iKoTN8mRDn9vWaCfc/WgYMTTMTPfJxPNa+SWQ
	 LFxHPn2/ISPtZOPJLXf8Q02Wa3XCroAk8hKGq5+rXaxd6frFWI4/oySP4fulWthTHQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ny7fxAhB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE492606A32C;
	Fri,  6 Nov 2026 14:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ny7fxAhB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EAA41F0089F;
	Fri,  6 Nov 2026 14:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793976041;
	bh=MStq/D9u6Lx4oTKrqyqI051eSh/8eE2W/WbUq/37lgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ny7fxAhBTpi7dWdrqN5kHkyZfumRtV7WSw/qtzbOWGic0DyP4Nw+nicdgg04U0HjY
	 hWuzOdDH65K4P7TfKwW79ZqLF+jI6vKkkqKmptEVXwYPEO0cpaUTx4Zu5CzCwXg9YV
	 rf7Iu8e6q2eNp+hTpTw+s6dgumD1tq3vdRgILZ5155X4fZC8F76svL26IQHAsPAgTI
	 hIkmwcR+MbbYIIlk0DiET+VhaLyj0NqO6yIn7LuucalP//52dY4Ni3RJva5C584ddh
	 1DzhvtYotc4EnZLiKWzQhxJkjLx6a3716FBdZHeLLR022Oci1ItrOylFtozHosmmrY
	 PK2GEkDVvHthw==
Date: Fri, 6 Nov 2026 08:40:38 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] ARM: dts: arm: Another batch of warning fixes
Message-ID: <20261106144038.GA340121-robh@kernel.org>
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

No, please take the binding patch too. Otherwise you'll get transcient 
warnings (I'm sure you check DT warnings before applying DTS patches, 
right?).

Rob
