Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.105.43.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300004;
	b=wIfaJDmaHpbOxSoQfF/HgtC1tAlcopbQWGqPHYCit4AGSYwpQ76vTS8Dnx3VorUo+2Ge
	 OWDh3qGBBkHio2wBUu6ylfPu6VKjNCSaCC0T9BRKkhvKaj/DUzcyvMAmLniIHJcfnyNPP
	 AgqftYprnAPdm2RLAfA8lgr4BowyTez/4mJyMcHNpSLY6FvPoIa5k7GDk0Wn3NttKypD2
	 QLOe9xDHp0kgFHlyeNf9Iu1Ed16W6TIK8xZWPWjjYF+Ct3dqY4q6wd+rpOzpTsoR3C+mD
	 pDs6f4ModVmws6+O7nZgySrFREQuaoGsY8aWF63xIv9JJuLo3bz7Zen5Ecm5APleAdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300004;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=yhrtAoUmb1ba6pgSshpme+NeuozvjU6Nr2zb8FJ6bno=;
	b=elXGS9D3aZWXa8anyn1SIq0ggahIHov9xbMAe5ZsgUPJ6aw+xTE/fobW3o3pVk9gkc0p
	 P7a72bw/fVS7jsYicQNnvb/z4Y77gSGbmR5DbvWGLzD/jFufyyGIQELgHvzOXtheOiVLY
	 JNqAysCBN/qGuydPbWpEfRd+ewt9wgANEvl47Rlsqn5fyYfH7UBcx17F1Zul7h4BO7p7K
	 tqIOO0TFJCtZLaJF/ng3k9QQ/26CMx7aliCNfWrPAulG/U2SQMcLD4ooV7r4MPy+SLDqT
	 b3yMCwlJ35XFmwua10Zv1U77/7infB8h7FY652TlEXVwCZFoW6Ip7oiuC2dJIPdPjBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=m8s+fdBI;
	arc=none smtp.remote-ip=46.105.43.131
Received: from 7.mo581.mail-out.ovh.net (7.mo581.mail-out.ovh.net [46.105.43.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B396606A334
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B396606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=m8s+fdBI
Received: from director4.ghost.mail-out.ovh.net (unknown [10.110.43.238])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4jFtfM4gy3z5wj1
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:53:15 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-zwq2g (unknown [10.111.174.98])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1772CC21F8;
	Thu, 29 Oct 2026 18:53:11 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.109])
	by ghost-submission-7ccd8bbbb6-zwq2g with ESMTPSA
	id X7pGMReW42oUfhwAcildmA
	(envelope-from <sergii.dmytruk@3mdeb.com>); Thu, 29 Oct 2026 18:53:11 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-109S0032d2b680c-5f01-4095-bf1b-8325b6a5fbb6,
                    80E54DDF43994B3DD4677030DFD12DA1D43C0C90) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.182.218
Date: Thu, 29 Oct 2026 20:53:11 +0200
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jiri Pirko <jiri@resnulli.us>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, jgg@ziepe.ca, david.quigley@intel.com,
	lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com,
	cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com,
	James.Bottomley@HansenPartnership.com, aik@amd.com,
	jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com,
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 04/20] Documentation: ctlv: Add userspace ABI
Message-ID: <auOWFzX5N7HBbcH3@MjU3Nj>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-5-jiri@resnulli.us>
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
In-Reply-To: <20261015145053.3664509-5-jiri@resnulli.us>
x-ovh-tracer-id: 10816238932508026193
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFRGI1yaOcyDfLgNXjfMxwmupW2IW64ehzRIoHhqwLBlPIe0jAgyJB0LlqKu0wtkov5oTsfOtxqVTrvMp41g1IW4164qf3YzjiVMHIil3j9rRAWoNXx3GiQVReQC9kv4gSz1+UST8GFYnYUTcgZllXIwzyufvQL6rB4SnBRobHyvpxxp4dydBi/G8rhr8eTNISs6C4cfrkUVgVh7QKeICXeIwY/NFnauWbK7VIpUUiWDXk+YLgM8Xrc0YK6W+iMtkXMPrXLTTZNhDWHz5rTmMOLTH9a6noJ9yg9Av2enhV1YX1pjSh9SByPSMh2zOloOHaeU/23sH8dlgGVpp2yd+qdbapURBXf4u5os5wNX2Zu1agAf8C4Bt9ZNqpSypCU/gO7ONqs0VqX6pGdvSCD6GrcW6Tr/XB0TCa8PbNUJQvjr+i+Tla6S/DDBSdhHNn5SvXpPBhKjk07tsRigUxl2j3j8A8tH8Z6gqB/j9w0Lt6dQrLoNO4wWWJxyDtzXkpQgXf7zgqpu29cJ9SACWzx5P2yopuxCnK5S2aIuRoAJ7amY2rtaudsAVO5Xj2TxwAG5G1YNaKWw2uxg+9YeyBvHlNiUnHknWq62yAjISOdYlrVBBG7uikbgh1l8+RIxA//3bVX6fUEsJkZAfNHhWZCcTCXHjHzjinvnV6gUI/6lvNd0g
DKIM-Signature: a=rsa-sha256; bh=yhrtAoUmb1ba6pgSshpme+NeuozvjU6Nr2zb8FJ6bno=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1793299995; v=1;
 b=m8s+fdBIL36ZAq008qBhqVz6RAHTHjlxNuQvwTcsNQlaE4Mtdv5HHoQW3qYXaHAGelZoqqDZ
 wuuSMUt0E7NFN1CiFV6+9Vh8s1iBHc1iVKFt2DIPaWlPJwo87MVwa6dh5F/YrWdGXOgdl+Af9lQ
 MwjUX7MhDUJRVXqprkwtKnRdRcqKELnJHjX6+CjhJ+s+jg1248O9/NsO72HDCmSBV2rg/dzRvuu
 W01X8YCRBGS8H+UEXtkKdL4CpYquFzR8HjASzSqNF2yzWuSNikI1oIUPXvVN+acwbjCuyW1vtgT
 PXQp0BFNgruNTNuLw5E/+1aKByLuIrenexkQlHKf3fTmQ==

On Thu, Oct 15, 2026 at 04:50:37PM +0200, Jiri Pirko wrote:
> From: Jiri Pirko <jiri@nvidia.com>
>
> Describe the CTLV transport, discovery, wire format and userspace
> compatibility rules.
>
> Assisted-by: Cursor: GPT-5.6 Sol
> Assisted-by: Cursor: Claude Opus 5.5
> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
> ---
>  Documentation/userspace-api/ctlv.rst  | 507 ++++++++++++++++++++++++++
>  Documentation/userspace-api/index.rst |   1 +
>  MAINTAINERS                           |   1 +
>  3 files changed, 509 insertions(+)
>  create mode 100644 Documentation/userspace-api/ctlv.rst
>
> diff --git a/Documentation/userspace-api/ctlv.rst b/Documentation/userspace-api/ctlv.rst
> new file mode 100644
> index 000000000000..5ebca3d4d94a
> --- /dev/null
> +++ b/Documentation/userspace-api/ctlv.rst

[...]

> +Errors
> +------
> +
> +A failed operation returns a negative errno. Where the failure is a rule the
> +message broke and the caller offered a reply buffer, CTLV also writes
> +error information there in TLV form: a ``validation-reason`` value, a
> +human-readable message, the offset of the offending attribute, the offset of
> +the nest it was in, the ID of a missing attribute, and for a stale query the
> +expected and the current generation. A buffer too small leaves it unwritten;
> +the errno is authoritative either way.
> +
> +What the transport answers with, as against a family's own callback:

It seems like this mixes results of several syscalls (e.g., `open()` and
`ioctl()`).  Does it?

> +
> +``ENOTTY``
> +    Not ``CTLV_IOC_OP_EXEC``; this transport has one ioctl.
> +
> +``EINVAL``
> +    A reserved field was not zero, ``op_id`` was zero, ``generation`` or
> +    ``cursor`` was set on something that is not a query, or the message broke
> +    a rule of the format or of the schema.
> +
> +``EFAULT``
> +    The structure, the request or the reply was not accessible.
> +
> +``EOPNOTSUPP``
> +    The device does not publish the operation, publishes it but has it
> +    disabled, or the operation is an event, which is read rather than executed.
> +
> +``EACCES``
> +    The fd lacks the operation's declared authority, or an ``O_WRONLY`` open
> +    was attempted.
> +
> +``EMSGSIZE``
> +    ``reply_len`` is smaller than the smallest fragment the operation can
> +    answer with. Nothing was executed.
> +
> +``ESTALE``
> +    A continuation whose ``generation`` no longer matches. Start the query
> +    again.
> +
> +``ENODEV``
> +    The device was unregistered. Descriptors stay open and every operation on
> +    them fails this way.
> +
> +``EBADF``, ``EIO``
> +    A blob descriptor named something that is not a file, or the file refused
> +    the transfer.
> +
> +``ENOMEM``
> +    The kernel could not allocate what the operation needed.
> +
> +``read()`` answers ``EAGAIN`` when no record is queued on a non-blocking
> +description, ``EINTR`` when a blocking read was interrupted, ``EMSGSIZE`` when
> +the buffer cannot hold the record at the head of the queue, and ``ENODEV``
> +once a removed device's queue has been drained.

[...]
