Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D22743C067
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789510894; cv=pass; b=hxOazZ/Gen3eADmuL5lms9DMkWxVwE9VJUruQFS5Rk16SR1EhIhDMYxdlp3sfPIPFevUoIysd4g1IKh6m6UYODGUaJM/PG/88V7MQI+VCe01DHFMZlkv9Z445NH4WaNRrLoT9Qxd26OJCECJxXJaGXgwrsBuDelpa+Onh4okAcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789510894; c=relaxed/simple;
	bh=zMEH3dKvgIFeOLNgenpgNKtSSPQyo3I2Bi4hOFPx7Sw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hRjEY6GhYqeNtkIuoHAh48h39NdOEHEWD5TdcUWEB6SQs6iGQnyKRjJCkX2jC8ey/BZ2DUVNZdPfq+KfSHDyWbxcncMsv2XSZn+xs2IMlKdEOlZqJM+GuHbrjdt0QfvJmNDRisrzhm0bDexRKKyiEGE6rLJ1tYiJQtUfNk9YGso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IV/k2TQj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aB07AtjI; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IV/k2TQj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aB07AtjI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYlJf721307
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=; b=IV
	/k2TQjkUrsTGpshqW8f1AkLpzgE6WqJLnJXyVNHKYz8mozA+vLQbIOpShvI99Nvk
	BGk11nj45xZQZMebNdo7NiYw/EO7W5wcvHVc8eAkRKtGrNMclkKkbe3unomYvdUd
	vFaT1byqggr1zubtRjDzuTG9pECEQdOzFAiv4kdIU3d7CXM0IsQ27dhrP8NvQBkU
	TlOdMgPnM8h4FF25SXM2n03VFD94RLvjnLlaGSHHxie20ptztZeSDX3B4EelrzMT
	n1DLEJiB1mKEp0dVH3Si7JCiMZpC8ZcIigaByfbQDV2F2ANWVcL1rru5kNRyAlZ9
	ag1DWjYpUlLQQuGalXdA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9s4m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:21:31 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-46524220c5aso5637298fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789510891; cv=none;
        d=google.com; s=arc-20260327;
        b=GmTKoEYHzdfW2zAD19aPKl5XPTHhK/YbHNYMUz7jLtw9IKIjuQL72aWrNTuILdf2kk
         nyd5J/+3IPWLNPXhDoruxDjyn3cnx2HMzT7zrL+c/cwuwzFTiAS7RBk6BBBRUWIgswnJ
         sWgDeQqkGGrer7SVdPlM3dN3iAO5k2I33LPXvewZcBfBcKoJD9QaJJRJNHT16HCNhMar
         pXZfsLCi9E6qCI/nkI81QlF6q107pIws4Kv/ybyrSJF6XmYSR+1gKZH/C+CJdNNPrkV+
         TV+yAMv7wRyv33K3chn4mRBa7stra+0rysjVmY2DTEs1vF4zB0rANWtiRDfd4uEsILJW
         oeww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        fh=eyuU68L+It2pSzSYDfAjuod8ga7C2EaPpETYB6F0bUQ=;
        b=DTwA/IDDR1URS06PsmZeOBEfTgFEymrh0ZM/1AYpDSr+snsGfepVm/a35q87inoa6d
         1jhZq6dFHa5ks9A07yJZ+v7fgMiehRgCNUxEMvx3EKuAzSkeEISBzS5YNM/s4PJJ03xg
         W2Ach7UtNAytqd3tjlmpvSbLvxWVIGx2rMkWlqVQeEeTTp5mFmHBbZR+polTZzn/3LIA
         CQDVmg2QWnH9WYxNsQ44OPShy/h8jxY2hMbqf7I95JSF+IyDlbsno2SG81n1b+FXVPj8
         sbSBh4moOU/wJRWan7oq2RZm5hoS7SMBKG7dx/lQJyaxtfqAw7M0bWmUBbUFkZWIr3ES
         u2QQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789510891; x=1790115691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        b=aB07AtjIKjPYRGcvBSuVUhbZlxd1+55zy/NhIuvnz19m7qssQTpE/4jhghs82a98Dx
         rtzGuCLITyYJpv6qqsfwRyWf2V/rvp/BavfnHKk+3jeYdHSZJCYDfk5x4efzm884vIfW
         UjGKSA8ySqC+bc1butY/HkkuCwEw+HH62Uipjk8j8bjqvTXRubAdUvP+c5BJvALTKQeE
         2MFV1Wjr7h5QJcQaotkuVTv077nzlClUSJUJjEEq6X2ukv02bdE+qejZx/+uCM7gRcPt
         xEQKVpHKyQ6abdYF/Q1vdcAj2ZFa315JGdv0g44dh8zUZEwY87qYbRStthdyfxwDukm3
         Mbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789510891; x=1790115691;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        b=ABNB8IxAcDCwS04Lk4EcURsbZa0b+5AKQKyUYBXTv5B58u046yktRapP6vIKku9GrZ
         0ZxfK4LH8SRODcwHC8M0LVnIKUo7ALuBEdw2+rWGuHHKCJh8x175L+vSmcjQpthLsduO
         BTuTlb8RNvxco9EPfR/8ExdAQVVoFgmpTFoIhrK0t/BYRaaUx5vcY4e2UVeyz/GMQbHX
         vgkKROepowD0oK/Y/cu6TJR3yLvMLOB9VP/iJyMWMPjELRZvQE3NFQ/ZmhglAWWwVB4u
         EfTZS2pd7wL60yL53u6i0OGsOBVbIDAW6A9TcHSYOU3IOG8p/s5B9823CSsxuAmqtwEh
         rlsA==
X-Forwarded-Encrypted: i=1; AKwUvBzi6TIum0Pyca/NqXZQCtDbn5oKShO0x8XkfvkC3SsHVve6z6VyhZ76LQufvOmI3fw4ivEGNgwUp79Jr8I=@vger.kernel.org
X-Gm-Message-State: AFuF++lU8zoS9XEH3bNqLnNMG83NHQ10lYDZE8PYnboX/v8iiD6PDSQT
	jU6oF6xFpIS4lutxdTKYV7Q+c+Qg1BO6ye0J5fnUZm9MiHF76VVws2kJPug254uoraMWEtYoQ/r
	bVTzN6Yk7gmIyts3K7xLD0Cy8z18IV2MKzVNldgesQ6hQYbBMFGUJk8sY1uyGE56Cs8+8itN4GQ
	iIMWWi3jQ/5e6zieu6gsRpsqFjuprXamf8sDa3hd0pYA==
X-Gm-Gg: AYBFou09CYQ4CxbNdyluufaP67O5TZVXDfR0sznvFqpbE/VQ7/rSmKQ9JobgqeKXZzv
	QktEmqyg7Y/uXcQj+l5G2GJdNHAwwWIH5VX47KYDQlpoFlj91RlE5INL+KiFDbSyKEMduO3fGlq
	2M/+2O4Y48IsvU1c5t0hxQ93KiTiuetlg5bBoD0uvxz7Upee4Ot6mqV0tL
X-Received: by 2002:a05:6870:30f:b0:45e:2de4:95f1 with SMTP id 586e51a60fabf-4847584c51dmr189762fac.2.1789510890853;
        Tue, 15 Sep 2026 15:21:30 -0700 (PDT)
X-Received: by 2002:a05:6870:30f:b0:45e:2de4:95f1 with SMTP id
 586e51a60fabf-4847584c51dmr189724fac.2.1789510890430; Tue, 15 Sep 2026
 15:21:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
In-Reply-To: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:21:18 -0700
X-Gm-Features: AcwNN1UxxSxAxz0XPK7niSod0Tx_HsUs-C3mKdcqDSaFkh659BGkCorPygYZGHE
Message-ID: <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>,
        Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org,
        netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, bpf@vger.kernel.org,
        David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev,
        kvm@vger.kernel.org, kexec@lists.infradead.org,
        linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aa9c4eb cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8
 a=2Rxv5svHm-zNKBYa0PsA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-ORIG-GUID: qtLHNNGsmEfT9SUR7jO2dN4f-5Vu1956
X-Proofpoint-GUID: qtLHNNGsmEfT9SUR7jO2dN4f-5Vu1956
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMyNiBTYWx0ZWRfX9qX9H+Gt8K+6
 iqI42JF0JAKLH9QC5hyorCpwhhCBoBJK9/mJJFyoq+qFwy6ShHXId7Jn1c3hFVJMJtj8mCqCCg+
 wNO31g0nEA9/MjD2QZpioZ6qTyGewPa+FHlxJgRBe1TkimkiN+yBH903iV/o6Lts3jWRw/EWXPO
 NQzmNTeAbPiAFhzAfDh3riDjIwd6QETDz7dY2c0TRoIQYMNYe5lLYFMbENtGl2bTjRXwP6ww6QW
 xx9uOsue0xXhYuikttFWqVdPkau4G3zQKFy//OzC1WCEIUvxleIMUzUjtMM027NZeQYVtxN0XTI
 ogn6YZIe+dKLKAi522lqVA4RHLVQ4xWxTYZ9oh9d7me5GKIMJiLpiB+f2OlGjBdLmPv1ccQM8S0
 WuJ935ARuyt5Ik3xopkrFpOzWS4BKIPEm4ruRKTMXFII4a4hfAOVh/P751fsBQ/f3tRJowLNgMS
 xcJ4RWYiEjjDxtRjGHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMyNiBTYWx0ZWRfX5EioM9ZqIKIL
 6JedvsYvMjkrht/FNg+36q6kP9WgIfDSKHP/Dr9ndixoy2D6qWypH2GhsQaPdoS0C1wzYzDM/Tw
 Rb555azEw8/FdFDXxBFjIgietp0Hv34=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150326

On Tue, Sep 15, 2026 at 9:02=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 15 Sept 2026 at 04:31, Christian Brauner <brauner@kernel.org> wro=
te:
> >
> > TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> > allocates a descriptor like get_unused_fd_flags() does and records it i=
n
> > a slot on the task. fd_stage() attaches the file to that slot and
> > returns the number.
>
> Honestly, I am *not* a fan. At all.
>
> I think this adds complexity rather than removing it.
>
> The diffstat tells a story:
>
> >  106 files changed, 962 insertions(+), 861 deletions(-)
>
> in how this adds a hundred lines more than it deletes.
>
> But to make things worse, it adds them in bad places: low-level
> architecture assembly code.
>
> Those extra lines are *not* making complicated code simpler. Quite the
> reverse. They are taking fairly straightforward "just deal with errors
> with normal cleanup in the place where it makes sense" and makes the
> *straightforward* case simpler, while making the big picture more
> complicated and subtle, and adding new code to places that are not
> simple and just blindly do somethign that makes no sense in that
> context.

With fd's it is more than just about error rollback.. exposing an fd
to userspace mid-way thru an ioctl is an easy security bug to write..

OTOH, "just use FD_PREPARE() / fd_publish()"..

BR,
-R
