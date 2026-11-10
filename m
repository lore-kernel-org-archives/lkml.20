Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309772;
	b=rPFiluF72u0HCwkyNhGGSLImkwvKJZNV8MCBupCisooryvPdNCQLFi9aD9sveZ0USDQJ
	 4tf1ICwFlQyAwjIMLHgT3wjiLdpy32JSZJxOvcFHimvMEug9WXuRh4j61DJSrFFGRCyxl
	 kGgooWC77g5Tk/V3OIuNkXDMWz1GJhzPy0j1YqFRFEheudPfHGOUESX8BUc5cZefrkq31
	 xZhQwaET+twm3LJULLlbw4/iIN2JJ0gFhSEUUvlHlMN1YnISuZhXFP7CwK9/534aL9eu1
	 jpgoKbG25PYIb4o6Cf7JB1KjdPdE0eSe+MV2e5rVYBByl7FQlMPly+BbJmzL1b9+VRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309772;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MA1GC1yRDgfd6kvrSMr4DQdcsKWFP2O2N2316AIcr94=;
	b=gVwk2JL3YJ4QVNfqqtD7yro8TC3kTSsDfVl6u/1iqaO6eCZMlKga0YWzXAOJ5Buyo8Mf
	 1T9Kkzz/hzh8fXogfmLF21/iPPOJwcSWRNk1rs72k7sKsAj5mUVwDAROBUhT6S0I4HjEw
	 ya4EeINwtJutT4fAT+W8/7Phc9yPOKs2s5y0q7v6Z4kAUQrlvHNFmSdBtsPCPi4CmLoE/
	 iDFjOXCoAvqcNtaB+OJuGz7v/NgbGLGxM5v4ntKjWGm+QlJ9QdCoY9L2XwIVYKsMWi0ws
	 KjEKjPdJPq8xGQZBYP7QWzN0IM0LWyt07zbhT49SHQr0rAYxi1+SJIVoM2dEXSLCZpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=P3oFmEoS;
	arc=none smtp.remote-ip=91.218.175.123
Received: from mta0.migadu.com (out-123.mta0.migadu.com [91.218.175.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC63B606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC63B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=P3oFmEoS
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gf0wBCYmSp2qDt0WBI/azgbTyIXjwytSr2pVYBP6fZI=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794309769; v=1; x=1794914569;
 b=P3oFmEoS70GBCWdAl/jm43mh7TWd18PLo5o1wWKZcuqey8dL6PGW/+00xd4d6NZvC9d2mfFi
 2HL3VWGcN/5R4Oi4aYLfon3w6PFbnNTgjApK060NJOtAKRkjQOoG5fLYNusiFD7drgLxHpKpjiw
 rjRGYa14JN4Ol2skNnWUzWQpVL39w2LU83yJcRKkkiFr4E9jxDbureolYpBeiC+z+HOXlc42oX8
 qn+gfEyT8OfWuWUdsphvRHZZyueV+wL1310yAB+v2rbAHp4hQZNZWxGVHWe8Hk+/AVLvEhZfiN4
 McAXS8JUh/P14KJ9CgKqMZESaz8QTiErDvPu+DaZ+SXbw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 89e0a6095e3c53c0;
	Tue, 10 Nov 2026 11:22:49 +0000
X-Mizu-Trace-ID: 89e0a6095e3c53c0
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 19:22:42 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/13] docs/zh_TW: process: add maintainers.rst
 translation
Message-ID: <avL-gswQcb-OD27Y@wyuan.org>
References: <20261106113545.708896-1-chenyou910331@gmail.com>
 <20261106113545.708896-14-chenyou910331@gmail.com>
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
In-Reply-To: <20261106113545.708896-14-chenyou910331@gmail.com>

Chen-Yu Yeh <chenyou910331@gmail.com> writes:

> Documentation/process/maintainers.rst consists only of the
> maintainers-include directive, which renders the top-level MAINTAINERS
> file.  The directive cannot be reused in the translation, as it would
> define the maintainers and maintainers_table labels a second time and
> duplicate the whole maintainers table.
> 
> Instead, translate the descriptive header of MAINTAINERS (the section
> entry descriptions and the note on the maintainers list) into
> Traditional Chinese, and point readers to the English page and the
> MAINTAINERS file for the list itself.  There is no zh_CN translation
> of this file to consult.

An interesting and appropriate workaround for me, looks good.

Reviewed-by: Weijie Yuan <wy@wyuan.org>

Thanks.

> List the new file in the toctree of process/index.rst, under
> "Maintainer information" as in the English index, and drop it from the
> TODOList.
> 
> update to commit 45a92c0b91d7 ("docs: maintainers: add SPDX license to
> the file")
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  .../translations/zh_TW/process/index.rst      |   5 +-
>  .../zh_TW/process/maintainers.rst             | 127 ++++++++++++++++++
>  2 files changed, 128 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/translations/zh_TW/process/maintainers.rst
