Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584849;
	b=CN8XVmPudbu76kfxukLNPq84PddVSKzfzvg/Ismp2viKD01aPDcolzyXleGy4ChKU09D
	 MSe00TSjraOk7S93ABfcB693vYUtjtdbjqOZJAeLhENDxSDtTRd+yNoOWrEB/QT9r2S33
	 +lCtR5aw6zxIvdppIEkJzy9itZKjRJMr/5fATHA/QTdlm4GVFVfsrb8XF+mOPi3BEdYTl
	 qiIZZ+ad2JRNsd1c9qCiUgXACH72goFLmKO4aXhb6M0h9SuJbhnaZkg8XNywBWUZFMPCt
	 whsxYFkh+2Ls0tFgeoLnx1EambaFJJvXwvqYknac/XXcicTJI/yu8Qw7HS7JFd7v0Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584849;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=h9BqSXf7g/loAE1yFy040EtHe/rxhdmlJ4V/zK4lUtY=;
	b=YcCAC//fGyAwvSeqL2EdiP+bQLkoX0oj9Cx03mIDfkklKt/7QtDVPCkBeGpm+PneKhBC
	 2noPusneCQKUZkGjGkmmudXllMIWjaMp+FgRIN+VOBioZ7lNC/oChq4LeTI7D3P/vW4OV
	 mh6IN8viiXVj3796sNDXnzbfImJ2esKHnoStZsNaM2KUtCUbnd679dxOLZpIACHLCYgAO
	 g3Daf11zv/ZiJLL7uQGXZR9ZD44aKO0kQQ7dEMfay7Y/WtNnpS6Pyt1o6qWcWQRxxugrl
	 hsprEwCX9hDXsa1OuVebuWwZJZ7afeStXfKj5jifvj7sN0txioQZQSXsxbsDyD9j9GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wj7NGM6l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DCUIDhhX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B735860A5BC4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B735860A5BC4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wj7NGM6l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DCUIDhhX
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRb1W2638613
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h9BqSXf7g/loAE1yFy040EtHe/rxhdmlJ4V/zK4lUtY=; b=Wj7NGM6l+Qf66YU9
	1Q3KBVqJOhJKdDvacN+5NCa87Z1uptSvFV6uuSUhtHwFDO6Et87Mnz9leStBgexs
	LVYGaEO9IcZYy6WFmR9t0s+2si2JpQ6hHcMBdVXvGcRozbOLvgXWo81G6EFQyEWh
	aFGgeSiRkG5/oTdhLkvobSbJp26ZziSr5husz0fHOrpe0QbNEtcH9iwTfarXO7nw
	XtEztMBr0G13UQxqVnCnB3Y4gIigQUgg3+SfZtwVHkSzayAN2FtaX1uOzghhZyFs
	MgX8CdqZ29G/fRjnWTi3qNA1XlJxdwbkAJ18CeI+zqoP0fuY83kqmO0ifRkr63EZ
	lskYqw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r9wq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:47:27 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2d60a8bf5so162020137.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584847; x=1795189647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h9BqSXf7g/loAE1yFy040EtHe/rxhdmlJ4V/zK4lUtY=;
        b=DCUIDhhXMTyQ74WsPSCshiMm68zo0LpBpZjVYBD5bpfIlx83zmjK51N9gRfC97yap4
         LOBFDDVu4iWeSGU/75OyQcPcV3+7YTc0krMIV8NdPwveD3sT3NMHD3qtsKNcPTKgqMtb
         bZkiHjEZQFeZcgeKTro2iLh421b7sQj2kIGbYKw/+gQvb3MWOXLusoMnpNy1wdjHC+dZ
         Xs5KUcsgmtMDbE3EEquSlVKM1+AKBRYJLb6PQHGKfTFeYv86HPFO75JMC7xAf6yfbJaF
         6SsbMXyKbeSsaLf8gCvZ4mpc67rFvnP8b7XVRn+kjxA6BnCQUJC8J7zSNE0yBj/Apygm
         EbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584847; x=1795189647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h9BqSXf7g/loAE1yFy040EtHe/rxhdmlJ4V/zK4lUtY=;
        b=aR2WHlepQEgrUuxC6ggXrzbtb28/oFmth0M6++peZCDtURc30qvh2TN0Fxs5H3L/MD
         CDDdOkZ+Fr2F4cximroYDuRAf84QCxLB7fjGz9ZaWg0Dqv+iKCjQTqe1iSA2kUSYkzCd
         /nq48hzy3mSJzXwWZSjZ3TWD1Z7HJpZ23/NMHnZNYHIL83uqWfVjmkCn4PoMugtWIf1T
         Y9GrWl+bBv4yH5IpLrFwKAzl8e65elqQlujlxyStrdlsN+QhYUc9goTd/kWTABt3A0LV
         3V/sbuOL97KGHK8TTHsB6W7FSlmUJ+ChLBMTrARv0fhtlOcU77hSIMLF8+vSfq92fYa4
         oYRA==
X-Forwarded-Encrypted: i=1; AL+hErFmr5T4lEqCZ3GsdyZ7QaE30BASPWjc1N27ySd0JJguSVM9biXutuzgbl1LFeP7IeP2QeSTTNp6SJ7LOGc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hN7Bi12IBoe1+l0SMLcymT6WPQqMC8/Lv2k8ZbrZNxXwJpSGt
	ATfIOk5PznGy5asUzEapnu4OMLNwFvv0TUUYpGmY/8K3DWFncARZokHkQtwNaYjjqL87YNLLjhm
	p2ECoBlbkk7+5RY4+VJZoj1e+OEIfCAr6MGi3S823023VY5tUV/caBuKnYAwVOxlHfAU=
X-Gm-Gg: AYBFou07XbJWH9FIHHahIABpVWLv0dqmi1pcDBAKfuVPIGEgbrcphfOG10IS8cG63qV
	ILPaA+ZijTrFoYRrHa8BvxOMZPMz2N+SX0ip9jENT3veJD4Xbw6GDC8oMVC7NjrPdWxbjRIKzLj
	2r11sAiZiv/kK4yk6sp0WV2Fdv6X6QIMgSMuFOjfZ3UuS8E672mxJzsylwBqUsMa4JSnjTQfieg
	j9F3BdO3asjgDb2vuxtcmceZ4K52gplTvbnrRkxeTtJTB53+EQRrzksUejTa0lPbRrqeWzTmbpq
	hxm+pOzPSpAqDIuhkVHUA6rYEO3hXLMVJFFoIu7jD0/QQOWvYF4bnoRm9spRK1jSroWT2bsodnL
	Tgcc9gc2Yi+R5Heo5PnPrVd3n+0mOyVZgywJvG00g6gjRjKVFdAXJmOWBuxhKZ4cMR7KclIknTT
	mDcg==
X-Received: by 2002:a05:6102:818a:10b0:7d6:56d3:f179 with SMTP id ada2fe7eead31-7d656d3f6b6mr438710137.5.1794584846868;
        Fri, 13 Nov 2026 07:47:26 -0800 (PST)
X-Received: by 2002:a05:6102:818a:10b0:7d6:56d3:f179 with SMTP id ada2fe7eead31-7d656d3f6b6mr438690137.5.1794584846353;
        Fri, 13 Nov 2026 07:47:26 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5636519f8f.21.2026.11.13.07.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:47:25 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:47:09 +0100
Subject: [PATCH v2 09/10] gpio: shared: removed unused field from struct
 gpio_shared_entry
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-fwnode-for-each-prop-v2-9-4edc23d5cf50@oss.qualcomm.com>
References: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
In-Reply-To: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=i7zxMYAqFJUyBEqlPaHykWLWPCM6j49xHF61fQqcpus=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zD4bbsGTYuR8B/fRFJSRBUVofe0VmHcgz9pU
 v0FuTOm/3OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavcw+AAKCRAFnS7L/zaE
 wwLaD/9WxTlodVpdLurb93SMv5oTkU/VAxD6kKUIZOuZi/HfbDhtu4LmbA3Z4/7Luuintp/9wLs
 CTn9APhLzVDzgFuscV4tJNZqp+OuE9bSE1uiyUvm3+r70NDyDpSYB82dxdnqOAou3pyMLJMBtaL
 Vynofja76JRvf0UBpZUbTpMiOkx7L3rI35hXYrIAbMNnAlAJLDGOSWd2CTqBGPav/sVjSjGUBIl
 7qihCvOw45kdP3kX9FeLrDjYZ69Ro1c6lz/xXD/zQIi1UMAZVm1gnIPsNl1QfGKtyk8rJu5T4Tm
 oiJlqzTbBHlqLUA5YdVwBBT7AZ6l9fvHv6CIT6+6qiX2f/uUy6lo29Ymd4UdxNJtkBFR8JlWTvs
 UnHl4u39eSU4I+8cv/EfLURPd7+3Pkxxa3BdFWMhMtLR3gxz9BCk8Ek/2gkdtiTDc7vrw54zjM8
 YyxA9YWiUiTYpgjkpcXipszOHO7wm8VNqLAGY8/kwHdGwG+FaGT4Ip/nQ+VM4XeiDhys9IotMlq
 lSn1fSkjMCzffyo3cpjWwATrJlx9xiYHPaJcFw+LvpOf0I6Mj9Hhd0fcoufJnisday+AoBcRHnY
 lnCWjmnXBcsEIs5gC1q2MtPR7Ii+g3Xu6xenhGuYeE/H5mHefQwJ8OpII6KluZ2ku4hqbskeepR
 zau1tf3u1k1DAQQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfXzNwUUkFNZlGS
 t05v94X/OioLOWwFqrSewEwHifNE41cjj+er5XHwkKkdOrhIKgRlDNR/GOd+H3K/2DN7P3OAKQs
 WAK8rPH1qIj3r4sj8fwfT5wIAe184dfv9hliyNPtPTqkNieer1pY7JAO1XsBhOVd0tXZzq7iwAB
 6pg4QFdtWfTnZ2lnlGImQTtarzvZ5mclevjIKwLiQNTlC4qM5hPkqvJQ+UWMZTrD2FET86foMD3
 hYO7o4AiuODQXujL97A3JkfrvUMioNz+W73OxC/gYeTQQWAKsxDNMDVAqILbh7sdLg5YpbGyeNx
 xbg0XmKz0IL2/sVrW7FAnQ17r1aC+PtwdgcJZcXvSlmHJPJ7bPcRCmlZaXSBfvjN3hfjK8tD/bk
 CHLJZtqw6QaarkNTewfPuISTLAsJx2+wALXjZ4GuBj+wngsntuJFDZGbO/U3XE5NhsIzhABZoUB
 z2KFddBBmWqZO+Ul7OA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX5gnt2TnCZ1Z0
 vLBUuDZEkgIhGo8DAS4RbJH0bUmWDEjSvkIEoSMgEhEV7Xwu6RdXm5KF8GEfL10v4CpQwdmANQj
 alr7rNsWTm/IqXzbB7zEADnneaIeDco=
X-Proofpoint-ORIG-GUID: RRL10fNEgm-uddQQlcJHzyrV4TBgsQeg
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af7310f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=RTVOz5xmJnInBJjvJB4A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: RRL10fNEgm-uddQQlcJHzyrV4TBgsQeg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130062

The index field in struct gpio_shared_entry is an unused leftover.
Remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index edb04a5bb987e12faf96e5b70198a9fabf60ad0a..44af3bc1494e47310973844a0ef19ac3ec5cd719 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -51,8 +51,6 @@ struct gpio_shared_entry {
 	struct fwnode_handle *fwnode;
 	/* Hardware offset of the GPIO within its chip. */
 	unsigned int offset;
-	/* Index in the property value array. */
-	size_t index;
 	/* Synchronizes the modification of shared_desc and offset. */
 	struct mutex lock;
 	struct gpio_shared_desc *shared_desc;
@@ -233,7 +231,6 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 
 				entry->fwnode = fwnode_handle_get(fwnode);
 				entry->offset = offset;
-				entry->index = count;
 				INIT_LIST_HEAD(&entry->refs);
 				mutex_init(&entry->lock);
 

-- 
2.47.3

