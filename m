Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283907;
	b=g//i9to7rnGrxzElWv+EIVFE8kcpsfXwrywRPeI2xNS09iIiNthSHpWTVw96uhLlJDjk
	 6cOhilgimUmHy29uJ7JCg0ha7gxqURm775Zj3oJmAg/Jlf4hTncbGIh3lOuoqpZUsKrBT
	 SaZxim/AaPn+tYJb44cwCMu5usKguBFKw9j3e4LvIHmW6iWCMcZ0VJrQeodpQKMMIotju
	 kWVTZDKFnTiDOxJlz12ppNsqPbB2YKgOLL4kahVXlufGnsWWOse8ttBga2N+pZfcbFys+
	 LWmRYPDrB41AshUlHWVMFsmKKlP2ksGlDxVaylQz2RGLxj7LjDU8unnmDfDjDNrcBDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283907;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fnCpADeK1lk1lBxoGBlYSY9jVj2WJp26T/E2RN7jnTc=;
	b=NOQikslJjCWTmT+3rVDtZqQ0HIjrfOIGAnWWzmdB96sfPG3VAU4meyWj69JUxQIS7uvW
	 WhyTho2JknZpRp3pXXU/ceKOnVikXc8ar/i7c8T+xqDB/thsdXNcUoqy8TcE1Ok2tpYw6
	 bcndsbHm7ynkmHfvcUKRhMDFgRqhxcC1WMb72RnKd0rhnfEuliWVZ5DPt02YJKpMSlJRD
	 hjmWN9OtVfuRcFBvie3ajTrjXiKoDL8oxImBJjrxugdvujgyk2ckprRwWNpYn4FKG5itC
	 FprEuWYmlkeqgtlZFVibvmBUs6SRTeZgwXzGx4tM2cmSQj9k2uacqLBa2IeJikLfl6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="aweuyr1/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C691606AA1B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aweuyr1/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A911F008A4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794283907;
	bh=fnCpADeK1lk1lBxoGBlYSY9jVj2WJp26T/E2RN7jnTc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aweuyr1/Ey7I1+R/3iu0ztxDYfNP7L4YOwTxN/m219Cb1oxF2ckvoWNPtQtkRDcY/
	 mrZxj+32x8UxRQN3lqKiPrA8TeU7pmH/VQlB8EDk53cXiD+bHoER6P/pZllgq3g5mI
	 268WCvN0+k4C7ujI/2Ugo4xvBVybzQrHO/Hgt4IAXOBdJjdC3CaSzn/7spncaUtTYy
	 1Nvn/zprxJf0t4paRXTqglrWL/Opb4bWZ/F0CZzzxXtjfVvM2FIWEUJg55e7OtO4XY
	 mKbORghCgSMIQ+gIF1DcdoIx3ps6HzP8GPhook5SfhWPMXCU5DCWjvkhBRy8WRZvM5
	 daqqs+eQPHnTw==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso274883566b.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:11:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHO93kQvQNCPXozCzhpel6wLmthsDlLXzl6hCe/+464kjXFzJYhC8EBYcms79J3yolmbSv/HSSFTrZmsHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FOXISJK0NlhBwOduXcnyiQEC9nksADesTn6zvcpezRvtp7PHx
	oLkGjkiFW9JXT7NTTvp/r/ubhnAs9H6IJoQp/8PlZ4gF5g4q+8P1R7+IESBAabAah+MvJy3GQkj
	UcH6umoQenLNjVVl+Al38GEoQelygCYw=
X-Received: by 2002:a17:906:ecb1:b0:c36:777f:824c with SMTP id
 a640c23a62f3a-c5047a43a58mr82746966b.4.1794283905613; Mon, 09 Nov 2026
 20:11:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102073532.98873-1-wangxuewen_ky@163.com> <20261102073532.98873-12-wangxuewen_ky@163.com>
 <avEwnT6CAgeCj2oo@hyunchul-PC02> <5f5302d9-729b-4008-b19e-f7012232e755@163.com>
In-Reply-To: <5f5302d9-729b-4008-b19e-f7012232e755@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 10 Nov 2026 13:11:33 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_qho6vncFoY=x4XVriXn8b-F7hgg=xbTTfJXH8nns5yQ@mail.gmail.com>
X-Gm-Features: AclHuK9JXmlrUEUNTyVtnytSEkXCL2PZWvSIdS3ugTb2tMwfmxgyUdzEYDT8kzk
Message-ID: <CAKYAXd_qho6vncFoY=x4XVriXn8b-F7hgg=xbTTfJXH8nns5yQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/31] ntfs: handle source record removal failure
 during attribute moves
To: Xuewen Wang <wangxuewen_ky@163.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Xuewen Wang <wangxuewen@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 12:13=E2=80=AFPM Xuewen Wang <wangxuewen_ky@163.com=
> wrote:
>
>
>
> =E5=9C=A8 2026/11/9 10:31, Hyunchul Lee =E5=86=99=E9=81=93:
> > On Mon, Nov 02, 2026 at 03:35:12PM +0800, Xuewen Wang wrote:
> >> From: Xuewen Wang <wangxuewen@kylinos.cn>
> >>
> >> ntfs_attr_record_move_to() ignores failure to remove the source attrib=
ute
> >> after copying it. It can update the attribute-list reference and repor=
t
> >> success with both copies present.
> >>
> >> Check removal before changing the list entry. On failure, attempt to
> >> remove the destination copy, mark its record dirty and unmap it, leavi=
ng
> >> the list pointing to the source. Report destination cleanup failure
> >> separately.
> >>
> >> Shrinking a record to zero needs no extra space, so failure indicates
> >> inconsistent record accounting. Return and report EFSCORRUPTED even if
> >> cleanup also fails.
> >>
> >> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
> >
> > This patch has the Fixes tag, but it calls
> > ntfs_report_file_metadata_error(), which is introduced in patch 3.
> > If this patch is backported to a stable tree with patch 3, it could fai=
l
> > to build.
> >
> Hi Hyunchul,
>
> Thank you for your review. You are right about the dependency.
>
> Would it make sense to reorganize the series so that the bug-fix patches
> come first and use the existing error-handling mechanisms, without
> depending on the new reporting helpers?
Yes. So I would like to apply error handling patches first and check
new report helpers later.
>
> I would then add calls to the new helpers at those sites in a separate
> patch at the end of the series.
Okay.
>
> Would this approach work for you?
Yes, Please do that.
Thanks.
