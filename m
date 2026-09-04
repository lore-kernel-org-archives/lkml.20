Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9051C29B781
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 06:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788503647; cv=none; b=NdxLWPL+dKZ5LQ68hj6Sx33wFS9hxbMox01HbJyURo55+kYZso72zCKWDCE0ScjB/qapueu5LHs8nylhrr9ZNn2I592dergXokCzh72fvy5sv0oLpYUAdo2Ur0y/poSePgNJ/KEF78WOiBfBHgreCuQJ7WrESoRWv/z0npWEwIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788503647; c=relaxed/simple;
	bh=4pJbyjG9MKJWAE9GxtVtEeFuCkCsAbCpu0WttTgVRp8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uiGQMW+NcTND6C0fAXdH81IS8FUM9LWPPhadkIk+ORLheFLPeLr+0x7CnDP9Akz6QWcGtkzLkVqGd3HS/hr1iLiU290TC/Lno6It8fPRP0lMd/fWpJ1VVSKp92sRrck4CFoDebuSvGKotSMCtucI6++DjP1S7ewAajKTXQENl40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMIQYEDH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMIQYEDH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681BC1F00A3D;
	Fri,  4 Sep 2026 06:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788503646;
	bh=ZFl8CqTY+R6cYlglIG1ZutosKrICQ4Qsj7l470yDFds=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=lMIQYEDHoNnJ7bXahMQhl355p0JYXlYmtChSYQvL/hgjn/ww5o+3GTrwqta3p42Cy
	 A2NBxe8q8SEWAzOVSQorMND1MlrRTkUM1cDQASi2Nje0kvnBoIgTeRh6brXGgzBtV4
	 13AJ76BBi/Ka9xIx0sNynImhs7m2Od5Eu4ZXChHSfHxV21HOxaZoAQ2z3dv8uevIRG
	 cmLXuzY+z7FyhXex9K7FSAUrlDsTuFmhKR4GlN/VKlpuD8CLDXl33YZvLxnLeZSVoh
	 J3CT1Vha/JfOEIYnlXjyX7IQte7JSK/KcgVR/gvSK/ZLxCRKZ7t3qzsU9j0nLOZLUU
	 dIes9fSb2zYFQ==
From: Thomas Gleixner <tglx@kernel.org>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, "Jiri Slaby (SUSE)"
 <jirislaby@kernel.org>, Radu Rendec <radu@rendec.net>, Alex Shi
 <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu
 <dzm91@hust.edu.cn>
Subject: Re: [PATCH] irqdomain: Delete irq_domain_add_linear()
In-Reply-To: <20260901064716.253399-1-jirislaby@kernel.org>
References: <20260901064716.253399-1-jirislaby@kernel.org>
Date: Fri, 04 Sep 2026 08:34:03 +0200
Message-ID: <87se3p8qzo.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Sep 01 2026 at 08:47, Jiri Slaby wrote:
> 7.3-rc1 is free of calls to irq_domain_add_linear(), so it can be
> deleted at last.
>
> I used Gemini to update zh_CN/core-api/irq/irq-domain.rst too. Hopefully
> the result is correct -- I really cannot read/write Chinese ("CHINESE
> DOCUMENTATION" maintainers CCed).

It's trivial enough to translate the whole paragraph with Gemini or
google translate:

  "irq_domain_add_linear() and irq_domain_create_linear() are
   functionally equivalent, except for the first parameter: the former
   accepts an Open Firmware-specific 'struct device_node', while the
   latter accepts a more generic abstract 'struct fwnode_handle'."

which makes it obvious that it can be deleted completely, no?

Thanks,

        tglx
