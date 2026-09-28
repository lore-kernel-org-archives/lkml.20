Received: from mta0.migadu.com (out-34.mta0.migadu.com [91.218.175.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3488A486E68
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790587114; cv=none; b=aVT3c9gPW5r9qbG9yswwRVJLIfx8cCCX/Nm5B5rpPX/MhLPnxuhGjmTT3OfAkZly7V441boRMp6jjZ5GczsXCi3G/ghk9MyBTscOi3JpYIMm97GHa5Z1v6rMkiDgZMf82n6vsZyCQDJWzUI1jBOJVIzLkTd9MvSSv704KbHP7xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790587114; c=relaxed/simple;
	bh=K099Rw5M4UKS31OhBymJo8V1Y7FIJNV2jyM3H5L2DaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNZ7T9A1vQxnIcwzdFXz5bkHrpHKGOHYCCZr44VeNGLWmuq8LPdgM7VTDxyUkMtpcsKlqiOtQPTNyrniNUhoo/u9R6qxt4g375wV0823wFiLdwSVKMkR1fwVcj9Th0woRKPIANMe8OC1He+WDRwMEIfPI1bQu2xndNZ66Jp4nKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=NYjivizC; arc=none smtp.client-ip=91.218.175.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="NYjivizC"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=K099Rw5M4UKS31OhBymJo8V1Y7FIJNV2jyM3H5L2DaQ=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790587109; v=1; x=1791191909;
 b=NYjivizCFZ6Fk9wCZIqxP3LJOkCi/u23wuiOeQKWr1bJ0jO74o0NgyGVxYnepHgnKmeYJ95c
 SwzoLQVMVDH+OS6wmsmEG/Q72nHC/kW5et+LHzT6hx8MxmxzjBj6s0sF1TYCqJe0rrCPxjPqZMz
 yMFC6nWirYUbsE68m4735olsorS83tzc5/24b1SNUy62aXK7/B6zp804rjj77Y803gD6d3WBir5
 rmE7OmgwyaVv/U/ifOIXUID8TvcXtSdQpT/QbLyaBfMWSiHkkrB5a17wo10z7yMIyxYHrhld4z4
 HPeWyqzzgPTpSozch1FUifmm1XQ+jGIZlrdPYX9ZT4U9A==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f274185ece85bc57;
	Mon, 28 Sep 2026 09:18:19 +0000
X-Mizu-Trace-ID: f274185ece85bc57
X-Migadu-Flow: FLOW_OUT
Date: Mon, 28 Sep 2026 17:18:16 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Jiaming Ouyang <jiamingouyang13@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	alexs@kernel.org, corbet@lwn.net, Dongliang Mu <dzm91@hust.edu.cn>,
	si.yanteng@linux.dev, skhan@linuxfoundation.org,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	rdunlap@infradead.org, baikefan@leap-io-kernel.com
Subject: Re: [PATCH v2] docs/zh_CN: add Chinese translation for usb/ohci.rst
Message-ID: <arow2FPuxMHjFNgb@wyuan.org>
References: <CAMnqnYwKwb5oTFOXNJyTJk2JEL6bnq+7yENm8v8RnovBYsFVGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMnqnYwKwb5oTFOXNJyTJk2JEL6bnq+7yENm8v8RnovBYsFVGA@mail.gmail.com>

On 2026-09-28 10:52:04 +0200, Jiaming Ouyang <jiamingouyang13@gmail.com> wrote:

> [PATCH v2] docs/zh_CN: add Chinese translation for usb/ohci.rst

We do not need this [PATCH] line in the email body, because the
"Subject:" header of your email already contains the info.

Or you can refer to my reply to Greg.

> Translate Documentation/usb/ohci.rst into Chinese Simplified.
> 
> The translation covers OHCI driver overview, hardware protocol
> differences (OHCI vs UHCI), improvements since 2.4 kernel,
> queueable interrupt transfers, and non-PCI support.
> 
> ---
> Signed-off-by: Jiaming Ouyang <jiamingouyang13@gmail.com>

And your sign-off should be above the three dashes.

so in general like this I guess:

| Translate Documentation/usb/ohci.rst into Chinese Simplified.
| 
| The translation covers OHCI driver overview, hardware protocol
| differences (OHCI vs UHCI), improvements since 2.4 kernel,
| queueable interrupt transfers, and non-PCI support.
| 
| Signed-off-by: Jiaming Ouyang <jiamingouyang13@gmail.com>
| ---
| Changes in v2:
| - foo
| - bar
| 
| Documentation/translations/zh_CN/usb/ohci.rst | 38 +++++++++++++++++++
| 1 file changed, 38 insertions(+)
|  create mode 100644 Documentation/translations/zh_CN/usb/ohci.rst
| 
| [...]


Hmm, how about read the SubmittingPatches file before sending out next
version?

https://docs.kernel.org/process/submitting-patches.html#the-canonical-patch-format

Hope it helps.

Thanks.
