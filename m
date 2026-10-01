Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AC63BBFBF;
	Thu,  1 Oct 2026 05:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832494; cv=none; b=cgE+VR4o+a8uNa7yTss7MTEYbpie8ESuWaYwkZlsUehVRNJ5u4OwRA72nm0XeCfmQMG6rGGPouMDW5lTspIRrvO2h5yZr1wGzycCF5N10GANC+aF57XuX0LzOGZPDNO23SYZ6pJkhfosfoXadhp9MX9TBIo9u9RITH/wzEB8h/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832494; c=relaxed/simple;
	bh=O1+u9QAgZo8fEMqCocTGHtkSqeimzrmGKQIJo9hj8Zk=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=tlK6LshtK5qkUaUd1/behY+0pFwCJEfEXF7JTARVIbG3oG43imIROzyOM8bN9diqcwkpj7tHZgbVhKI41BELtDlJ8OABsAKzXjKYNubba08OnL6JKAM9/wSMSa8xvMxYJSAJjc2Vz2dIjE8rkRMzErsw3J1y90Zh1Q+OLJxsBLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yHZ1O2Pq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yHZ1O2Pq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B701F000FF;
	Thu,  1 Oct 2026 05:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790832492;
	bh=wbLJ1yL45DbHK8Qr6+DZt0YumZva2sjDLQpTyD5/0pg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=yHZ1O2Pql4fxPwTMLj1x6WTnzWpxV35zbS8n9SFRTKlOKS9FUKy4ogRugM0bTFbZa
	 Zo2h37Sbn8beNrk2jQXMoesU87Rc9ONqWEN0+ZDTMQBEi2pLFFNNY9IgVKsTKQiQ1L
	 6GLVKxgNiLNmxpNvjcA0qY9e7Lcn6tAaygYu0nAk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] staging: rtl8723bs: return bool from
 check_pending_xmitbuf
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260919210645.25796-1-matheus.aalmeida@inf.ufrgs.br>
References: <20260919210645.25796-1-matheus.aalmeida@inf.ufrgs.br>
Date: Thu, 01 Oct 2026 07:27:56 +0200
Message-Id: <179083247614.1820101.3792083967746706444.b4-review@b4>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=O1+u9QAgZo8fEMqCocTGHtkSqeimzrmGKQIJo9hj8Zk=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFl738dF23otcn046Ub2100yt/fMXXtEZfl0nXdNZ72Pe
 fx0do2Q6IhlYRBkYpAVU2T5so3n6P6KQ4pehranYeawMoEMYeDiFICJeFkyzC9rK//BuTZb7XZk
 XJrTNIUom2fH/RgWNPmbf+pgnjfvd+cxVrv3hgHd3JeiAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

> check_pending_xmitbuf() returns only true or false. Use bool as its
> return type to accurately describe the function's behavior.
> 
> Signed-off-by: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
> Link: https://patch.msgid.link/20260919210645.25796-1-matheus.aalmeida@inf.ufrgs.br
> ---
> Changes in v2:
> - Add missing "staging: " prefix to commit message
> 
>  drivers/staging/rtl8723bs/core/rtw_xmit.c    | 4 ++--
>  drivers/staging/rtl8723bs/include/rtw_xmit.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index 95350fd6a94f..634320e53aab 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -2469,10 +2469,10 @@ struct xmit_buf *dequeue_pending_xmitbuf_under_survey(struct xmit_priv *pxmitpri
>  	return pxmitbuf;
>  }
>  
> -signed int check_pending_xmitbuf(struct xmit_priv *pxmitpriv)
> +bool check_pending_xmitbuf(struct xmit_priv *pxmitpriv)

Shouldn't you also change the place where this is called to take a bool
as well?

thanks,

greg k-h

-- 
Greg Kroah-Hartman <gregkh@linuxfoundation.org>
