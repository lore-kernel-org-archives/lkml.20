Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654E13EF0C2;
	Mon, 14 Sep 2026 08:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373570; cv=none; b=MXivGruZzmT6FVEKPLJdpD3KdBuhOhITdplYTOAcb42wY1lL97MqDXQ1aiwu3czt74lPuU6YOJg2qSacjBPafWvnnMkkIdhjZFbZXf7t4LWQT+JceAkMfSPeQ5EJtPBgY6Hrl9ZIAX819bpg/EjsR7C6B/sWSulQ3CopWk65eVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373570; c=relaxed/simple;
	bh=/N3iz3fcK3/IVVANrfZUmxF5/JomEJpwbXDj8ovOGJU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qXN7KdqgQ6jLgSDRpW0OtKq+8aO9s9lKBPOoadAaybVHoPuYZiUAHl1mKj4L5aRVmF8fJDCKCgVRCjRO2NsildQF33adTI/gZpsITGyBvKLXvY4SKroJ2D/RJY4BiZAOF1L3gNE1Xf+mGBigsd+C6StYjpWssXYfsnl8X20xKxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UalSTNJM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UalSTNJM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561F41F000FF;
	Mon, 14 Sep 2026 08:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789373569;
	bh=J1egWE5BO4oLYUePaDen4dsUucrzJfqbER4QMPWsIGk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UalSTNJMErzVSncsQ1mPbwAjMwKJOTKwo687Hn/7h32CLMFODz+IqIZ/K9awHzuqz
	 me1ciA8zcBoYCKCBU8rLeBCUGJ0WOqn71TXiqmTVGuRHEpqKrIaQiKwMBwNOImCfvf
	 Tb/QNpZPGBuLd5eW65IYMVqm3ApdVhjTMjgvpzuTRjKsoBRttQfZBM+QGKu1vJ3fw5
	 QxsMR8nvquou9wNb7+T8pN0lNoja7TovdseYVySiOsMkdZGjdD7w+fDgTq8EJ/9APf
	 i1wbBhs4EOkZDz8+EBpXxO8bFDOcmVQl7H61yWegdqRCMQlREvslNAka/1WF2wEkLm
	 Iq8MJbPPpozsg==
From: Srinivas Kandagatla <srini@kernel.org>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
 Jianping Li <jianping.li@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 quic_chennak@quicinc.com
In-Reply-To: <20260907070356.509-1-jianping.li@oss.qualcomm.com>
References: <20260907070356.509-1-jianping.li@oss.qualcomm.com>
Subject: Re: [PATCH v2] misc: fastrpc: Reduce console noise from expected
 DSP info, reserved memory and session messages
Message-Id: <178937356713.258680.1119640361942817879.b4-ty@kernel.org>
Date: Mon, 14 Sep 2026 09:12:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 07 Sep 2026 15:03:56 +0800, Jianping Li wrote:
> On some platforms the DSP firmware does not support the fastrpc
> capability/attribute query. The DSP side returns an error (err: -1)
> while handling the request, so fastrpc_get_info_from_dsp() does not
> return DSP_UNSUPPORTED_API but a generic error, and the "else if (err)"
> branch in fastrpc_get_info_from_kernel() is taken.
> 
> cctx->valid_attributes is therefore never set and every open()/query
> re-prints the same "dsp information is incorrect" line. This is not
> tied to boot timing: it can be reproduced at any time by manually
> starting adsprpcd. On RC builds with metadata flashing enabled several
> clients come up and flood the console.
> 
> [...]

Applied, thanks!

[1/1] misc: fastrpc: Reduce console noise from expected DSP info, reserved memory and session messages
      commit: 94778611d71b57ff917de507229e1c58ad9deba7

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

