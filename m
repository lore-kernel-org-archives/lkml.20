Received: from mail.noirlang.tr (mail.noirlang.tr [217.18.210.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08493367B63
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.18.210.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792321255; cv=none; b=fFq6mrlUr7Weq3ThfZ/UQGiW69RYt5HeZ/PZnJCbBrZQLyiNdNrrdFrcDzp4qZ2GxJEjQ4CIFRAN2OnLl91T5A3/Zii4D25mNxaONywLBaZYh+6QFvzryJDtanJit6T6X/dntl7hNrsI2SLMOpPDl3479CsfdgkKSxfcjrJIOm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792321255; c=relaxed/simple;
	bh=IvKds6s8eJNcSy+1rSvwbPehDm05TXSoHOegAuRoEwA=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID; b=iftoyyp+24Ej/xLPSr5KnvwRvZPyKd9WjMW2cKAruDbydQd3DHOK1IDEGepOpDcH4YTyOqnVFx3/pL4lYE+Qcvk5HBQdGrnhEZF4hLgACPTe2mqDF4PecIe5lBkFYvQ4bWT2WiX6uOystj0dAZzrGK0SC8o79ordMLEWi2SW8Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=noirlang.tr; spf=pass smtp.mailfrom=noirlang.tr; dkim=pass (2048-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b=QG4g1Px6; arc=none smtp.client-ip=217.18.210.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b="QG4g1Px6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=noirlang.tr; s=mail;
	t=1792321251; bh=IvKds6s8eJNcSy+1rSvwbPehDm05TXSoHOegAuRoEwA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QG4g1Px6UlDxzneIwrbGuEDwRaTO+GKs+sFn0YQn0cBHUe9BkCsOq08rcyf0TO67D
	 u4oN/YaMHxIL364GNgplGzt+Pr3MylOsEJmFeCeGhPjmwqiv8zDcYYdU0EwEMza82g
	 k1Kv1wmmd0Enyb4agkD36/QcGkkqyU+gSqNppDDy3DnnrR1G/c+wizUJAZyOPF4WYD
	 gPMpKnS7yu3NWEzdSfADHjCbS2ypvkYF1E5RhyYHuuNT5nLgW0bLYXH1fg9xjEKhZY
	 69nblE9q6xb3AeM4JpWEDGWf13zktJ57yBMpiKoBjj+TU1PHlyH+YwZB1kHzIlSEp9
	 NgY8t/CV8uzyQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Melih Emik <melihemik@noirlang.tr>
To: Dan Carpenter <error27@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
 gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: remove redundant dev_err() calls
In-Reply-To: <atSjRzJ3_ORJ_uh9@stanley.mountain>
References: <20261018104223.164776-1-melihemik@noirlang.tr>
 <atSjRzJ3_ORJ_uh9@stanley.mountain>
Date: Sun, 18 Oct 2026 14:00:50 +0300
Message-ID: <179232125059.295089.11354359693726377618@noirlang.tr>

T24gU3VuLCBPY3QgMTgsIDIwMjYgYXQgMDE6NDU6MjdQTSArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToKPiBEb24ndCBwdXQgdGhpcyBraW5kIG9mIG1ldGEgY29tbWVudGFyeSBpbiB0aGUgY29t
bWl0IG1lc3NhZ2UuICBJdCdzCj4gZXhwZWN0ZWQgdGhhdCBwZW9wbGUgdGVzdCB0aGVpciBwYXRj
aGVzLCBzbyB0aGVyZSBpcyBubyBuZWVkIHRvIHNheQo+IGl0LiAgSWYgdGhlcmUgaXMgc29tZXRo
aW5nIHVuZXhwZWN0ZWQgdGhlbiBwdXQgaXQgYmVsb3cgdGhlIC0tLQo+IGN1dCBvZmYgbGluZQoK
SGkgRGFuLAoKVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgdGhlIGhlbHBmdWwgZ3VpZGFuY2UgYW5k
IGV4cGxhbmF0aW9uISBUaGF0IG1ha2VzCmNvbXBsZXRlIHNlbnNlLCBhbmQgSSByZWFsbHkgYXBw
cmVjaWF0ZSB5b3UgdGFraW5nIHRoZSB0aW1lIHRvIHBvaW50IGl0IG91dC4KCkkgaGF2ZSB1cGRh
dGVkIHRoZSBwYXRjaCB0byBkcm9wIHRoZSBtZXRhIGNvbW1lbnRhcnkgZnJvbSB0aGUgY29tbWl0
IG1lc3NhZ2UKYW5kIHBsYWNlZCB0aGUgdGVzdCBub3RlcyBiZWxvdyB0aGUgIi0tLSIgY3V0LW9m
ZiBsaW5lIGluIHYyLgoKVGhhbmtzIGFnYWluIGZvciB5b3VyIHJldmlldyBhbmQgdGltZSEKCkJl
c3QgcmVnYXJkcywKTWVsaWgK

