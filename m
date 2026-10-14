Received: from sonic312-21.consmr.mail.bf2.yahoo.com (sonic312-21.consmr.mail.bf2.yahoo.com [74.6.128.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A00485511
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.128.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792016541; cv=none; b=PQP8Sjtxp3rYCn044k3AkyYyIbXk8uaKjHg2uGMZZPKrto/JjUTzL7Uu/FjQ7ZO8OPY70+FzXa6ws6blQgj8EbZYeRC95EnDz1C4zabNNnvj0GxCIzDgydWwoe3NKwuyUaHn/1/U5TrzX96cReGkBzuYRzJSl2u6ESMJcZP5D6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792016541; c=relaxed/simple;
	bh=22rh2zgvVwGy0yPhA7ZVRYDeOghFgS9cVi3/wmOGsXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ujcAQl7LtDW+zNxZHqrbcB7DJqPffFIdlNSib8SRHXOQe0UpN0NE+nHSPEw3z4ggFhtNR8yutpMzyYqjWyfaT3X3c3lLRGwwWvA8UPdNOf6VNvH/PUp/vGi91aodo0wcMaF5ilONS1GCw8MKTDeMqXTwGHyqOOfqKRBnUtxuoXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=dhgEoOVR; arc=none smtp.client-ip=74.6.128.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="dhgEoOVR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792016539; bh=2lyXd+fDqFFVLb6Ux/gSobPldVCnGppznjAjTuiEp9E=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=dhgEoOVRuyt9//viM2epKHsGOdj3qrXt4ufEuH6wUYTWBkjsjP8tgt13XImw+rteGILo7TSwcvf1Qr2E7UDPgCjotcEOG2yADOavDj6ildUTkwJIhHZnZ/+CdNITuLdUhbPRBkyvke4gCB+J4LkE4os14hPdl8zGWmIjB5fz9KTNpCcOxcDNKb/dsTqb/PTL59rxXdRq7KlGg9EhNBTPl6dsOwBLx7UlGDRvktoQ4FdE+m7/AmT0Cb69/icStlmrdSpLmqm0OhMyZmSQsx17TugZItp2SbVoDgRZ8GJY3QhzNTtIRH64B/CYbrUGM69gNwE6lpz5bQFJiNBEEHP8Gg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792016539; bh=WXXSV5xRL912FatuJBGWMMtObZrG0NjUQyHQ3bBi2Uu=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=seuQ9Mi0pp5l4pXS6VBeWe4Cw2xuWVPEe2ftBlZtp6ctbavadd3MYLQLKLYqhHI2EarW0E5qKSNXgo+yDbNXLHnEtU9XCuBzZhuSpAITE06S0mV9YNBKIvCk/3ICRWCiRXdarPk0jFj1yBUcj4GpBhktSqVho6tX6DQ/c7UNZA4qDnWhDVc9GZz1LYdvMMuF9he5RNyjA4KgndaP8dAvXiOpiM5OY2bpZWcnXmyGl+l1D9oGYpifc47+XlCxg0G2B4p7HrHenE2v4zWYcAD1dcOp4cyPkUaZbIDf8MnkQQj9ycq8DCPNCdCjJ6eoBfrQXZqIqGOoE5deg27fOf+JfQ==
X-YMail-OSG: Z0seP64VM1mTHVwywJ6FSoq5MxYNK3XDe9L1ZdGx9MG70I3B1z7wJfecdIXA_DO
 CyM7oMXTBqp2MPvqXxEdHgEAAtoB.HmcCX15pwYRoMc85YIJ.BRHaU_NJWmIbxNIuiYvYwbIJ8LB
 09cgF.ARaczmGQqwC.xGGcQcuv0hymNbzqMi9JJWNKRTjCDPPZLVNj73CsrBhyMIL00hDH4DmIJp
 30CDP8seQcz.VcJ1DDRS3A2Vio3lNPZ1t4CGB9kcxrHw_.mG81bJojvBrejh7aE9XCfz4Fe9fAbW
 Kl.hCoFBbi3IFbcsewtLcKIQHKJpzxexy5c1V_lRiDgpfG8CDQYjuAGN6uZTl5wDWS.mBxjqdl_f
 ZUZRR_8xAcUxGfgOO3dya36vlXT3gsSSPdEuxU8EhGfPjVLarFGohnhaXPuTXdyoLdAk.SQSRXIN
 TfyxYAIiGOlQIiXWEzA8RbYo9OMZHRkBpeQj8URuGbh8bAre4VqQ_okxtdwcH1wTEhJ0MTGH5XPo
 COlQvU4YUZUMeHWAJhic9hxxtLX8fxc8JYv1UoHwOSNmVb63iYNQCcZvQiBAMYfORXyu_.kBkmWa
 UbZ23IGZt50LYqqqPWWq9gnaSgGj7pw1VrkSqYl2o.Tee3LW0gPE2ueiYzzWX0rUs7Qyx0KZD.0O
 KzPjqW5cPnkpyhR9ynJlvqmIQeAc4BZrrAjAKsFDUCAVc.MVronAQ0K32fFvD1j.HXHRz231gTBC
 0c.WTik96to67Wh9yeMkf1YL.qeYSWCBOdkuNtX2TonCxa7Zk.4s89TqMPRns0OvomPRWMwmz0lH
 iMqytBP_qJLdqAhX1yKV4mCIX1nVrzqQKOIRwJy8SsL5S0AsPJjxc74AUJBNzhbh46KuPAOT34JC
 eBKczRjDyo.q1f9j6CCFTD2wPdys0qJng8pz3jroE0FR6oyGvVfwySkK6c0GJCQsOhYu7wzlzMQ2
 EkePQRJGa6qkcvew32ppE6RfBKRqav0_RxZAssGvQt_ZTgj8xhH7Jox48qnvV524dJhAToa8x2Br
 SYToK8W4Pi.MvkTLnGHOq6X_G0U3GqaW2CGjW.sT3UrIkd2EkuukF9a..pKkwF1Mjky51KvYnt.y
 9Ul5hvIyi501V4oEDjUDwllgDQrz8AfheebZ_ck72u1q41kz8gp1_qGtH5_GdU50PWPduFHitzRV
 M.m5bk0P2L4bOQtBZPcNw6YhOrAgbuVTdbWEhx3lBnM8cFVpmjUH1yXRGZzSlsDxuH0U8zjUTsku
 YApNhvNdPdvybNpJ9K9p3xrTx8vTH1hCIKTjQglapyI2xy6hg7aYAGVV8FlwQN7hqAOWfiTlQeKp
 d_vbOjAsRe3wGoq9QQNquayFy28Z2ucUyjC0Hpiq6KXytlmTPdRc8B.6PPDtpkNK2zqwfwAQDA7p
 qI1lC5CIcZyF5VQq5m_mN0ca0OIE5kj9MUabfMDSFuGb9WjUy4mVcBWkrceyR5C9y67dC6F.OvJQ
 M5bAJ8C9BOICglfw4Rxri6AUsptAMKPp8YrRhtqiRx6fbRHQuWNYzZblRMExKyXAHV0I57Oy3ORu
 PBA6wxxH3nuVtyzkFLNCu4BYPhs4grRu6rTJ0hODSXVcFhb_892D8eO0yYb4PKxNQaLKDq0oMCUQ
 vie_qqk.8Ss72yZpkw5iShLVpD4kzNLPuHEvvshhog6oIyG3Y3zca.imgDDJxVltnIfFO7W7E2lr
 I62XPDDGrE6_NJqvhCtFcwQEJYNLPVGpQ32Imk4DwvoHH3Cq6NP.miZKLqJSEoI5PjwqW9QUpmJQ
 yCaydd8d.W.Wta5JF9ZJUCl2K0BrSpaBxvFGU68SgRVSiTG7wHaWrKeFpYlqeDY2kLNoE9vpE6PY
 3_qOkxRNaERDnq3kUJPI7VG1dcqhXRkMAQx4XkfwUYF7sTMDXOlnlkqpLtxSjjqMpyNVwIb0gyBf
 zIFa1dpTAuhfISrn92W3TJqTWlyGUikw9Da5t58c7A806AkX3jK8lGGthLAVwrZuMMyuJlFHHR0w
 EeCVJsrP1HqtPsSFqH7CbparmmfBbh5AJ2OsHz9msEJ3l2Nn5lHxhF5_TKqD94cje5xq5yXzmRgG
 7QDk.I9EYgFaGuE.dLXKYzeUNWh15zcnZUkq2q6WVVLGMokdJd4FrNDb2K6d7HuBSW5VM9I3TmyI
 JIKdxjDcsQPWeGX_Ginf30XDTzhD9Mrfyy.LDeaoT7CaeAwPpDp6_prxKxoRFshWqKqQokxZ1SVc
 oVIup8x8zrbK5Wa3IAN2KAuuBxncsIoJJFA--
X-Sonic-MF: <deaner92@yahoo.com>
X-Sonic-ID: 06a2b5b5-4991-40c2-827a-2f8435ac73d7
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.bf2.yahoo.com with HTTP; Wed, 14 Oct 2026 22:22:19 +0000
Received: by hermes--production-bf1-6d6877594b-mcfwx (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 13145d99c0856444ce8fdd200f288c70;
          Wed, 14 Oct 2026 22:22:16 +0000 (UTC)
Message-ID: <c4c3cfb5-1933-484a-8ad4-acff8dacd178@yahoo.com>
Date: Wed, 14 Oct 2026 16:22:10 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: Remove unused header declaration
 to_fw_mgmt_connection
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261014171342.97160-1-deaner92.ref@yahoo.com>
 <20261014171342.97160-1-deaner92@yahoo.com>
 <377d4e4f-93bd-6634-c3c5-1113f5057e2@inria.fr>
Content-Language: en-US
From: Jeremy Clifton <deaner92@yahoo.com>
In-Reply-To: <377d4e4f-93bd-6634-c3c5-1113f5057e2@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.26740 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 10/14/26 1:13 PM, Julia Lawall wrote:
> 
> 
> On Wed, 14 Oct 2026, Jeremy Dean Clifton wrote:
> 
>> commit 3228900f80c2
>> ("staging: greybus: Remove unused function 'to_fw_mgmt_connection'")
> 
> What is this?
> 

This is the previous commit that did not remove the prototype of the 
function it removed. I'll include a sentence explaining what this commit 
info is here for.
>>
>> Function header declaration needs to be removed after it's declaration.
> 
> it's -> its
> 

This is a grammar and semantic error on my part. First, you are correct 
about 'its.'
Second, the word 'declaration' is truly not correct here. It would read 
better as 'definition.'

"Function header declaration needs to be removed after definition removal."

Submitting v2 with corrections.

Jeremy
